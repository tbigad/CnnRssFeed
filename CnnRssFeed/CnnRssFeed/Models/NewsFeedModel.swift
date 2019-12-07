//
//  NewsFeedModel.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/2/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

struct NewsFeedItem {
    let title:String
    let description:String
    let link:String
    let pubDate:String
    let media:[String:(Int,Int)]
    
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
