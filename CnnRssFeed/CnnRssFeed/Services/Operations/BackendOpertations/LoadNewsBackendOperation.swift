//
//  LoadNewsBackendOperation.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/2/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation


enum LoadNewsBackendOperationResult {
    case succed(NewsModel)
    case error(String)
}

struct TempNewsItem {
    var title:String = String()
    var description:String = String()
    var link:String = String()
    var pubDate:String = String()
    var media:[String:(Int,Int)] = [:]
}

class LoadNewsBackendOperation:BaseBackendOperation {    
    var result:LoadNewsBackendOperationResult?
    
    private var newsUrl:String?
    private var xmlParser:XMLParser?
    private var currentCharacter:String = String()
    private var array:NewsModel = []
    private var tempNewsItem:TempNewsItem?
    init(withUrl:String) {
        super.init()
        newsUrl = withUrl
    }
    
    override func main() {
        loadXmlData()
    }
    
    func loadXmlData() {
        guard let url = URL(string: newsUrl!) else {
            fail()
            return
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                self.result = .error(error.localizedDescription)
                self.fail()
            }
            guard let xmlData = data else { return }
            
            self.parseData(data: xmlData)
        }
        task.resume()
    }
    
    func parseData(data: Data){
        xmlParser = XMLParser(data: data)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }
}

extension LoadNewsBackendOperation:XMLParserDelegate {
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "item" {
            self.tempNewsItem = TempNewsItem()
        }
        if elementName == "media:content"{
            guard let url = attributeDict["url"] else { return }
            guard let width = attributeDict["width"], let w = Int(width) else { return }
            guard let height = attributeDict["height"], let h = Int(height) else { return }
            tempNewsItem?.media.updateValue((w,h), forKey: url)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if tempNewsItem == nil {
            currentCharacter = ""
            return
        }
        if elementName == "link" {
            tempNewsItem?.link = currentCharacter
        }
        if elementName == "title" {
            if !currentCharacter.isEmpty {
                tempNewsItem?.title = currentCharacter
            }
        }
        if elementName == "description" {
            tempNewsItem?.description = currentCharacter
        }
        if elementName == "pubDate" {
            tempNewsItem?.pubDate = currentCharacter
        }
        if elementName == "item" {
            guard let tempNewsItem = self.tempNewsItem else { return }
            let readyItem = NewsFeedItem(title: tempNewsItem.title, description: tempNewsItem.description.htmlStripped, link: tempNewsItem.link, pubDate: tempNewsItem.pubDate, media: tempNewsItem.media)
            array.append(readyItem)
            self.tempNewsItem = nil
        }
        currentCharacter = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if(string == "\n")
        {
            return
        }
        currentCharacter += string
    }
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if tempNewsItem != nil {
            currentCharacter += String(data: CDATABlock, encoding: .utf8)!
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        self.result = .succed(array)
        self.succes()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        self.result = .error(parseError.localizedDescription)
        self.fail()
    }
}
