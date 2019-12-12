//
//  NewsFeedItemModel.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/2/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

struct NewsFeedItem {
    let title:String
    let description:String
    let link:String
    let pubDate:Date
    let media:[String:(Int,Int)]
    
    init(Title:String, Descripton:String, Link:String, PubDate:String, Media:[String:(Int,Int)]) {
        self.title = Title
        self.description = Descripton
        self.link = Link
        self.media = Media
        
        let dateFormatter = DateFormatter.RssPubDateDateFormat
        guard let PubDate = dateFormatter.date(from: PubDate) else {
            pubDate = Date()
            return
        }
        self.pubDate = PubDate
    }
    
    func getCubicMedia() -> (key:String,value:(Int,Int))? {
        let ret = self.media.filter({ $0.value.0 == $0.value.1 })
        if ret.isEmpty {
            return getSmallestMedia()
        } else
        {
            return ret.min(by: { a,b in a.value.0 < b.value.0 })
        }
    }
    
    func getSmallestMedia() -> (key:String,value:(Int,Int))?  {
        return media.min(by: { a,b in a.value.0 < b.value.0 })
    }
}

typealias NewsModel = [NewsFeedItem]
