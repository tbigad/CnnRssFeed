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
    
    func getCubicMedia() -> [String:(Int,Int)] {
        let ret = self.media.filter({ $0.value.0 == $0.value.1 })
        if ret.isEmpty {
            return media
        } else
        {
            return ret
        }
    }
}

typealias NewsModel = [NewsFeedItem]
