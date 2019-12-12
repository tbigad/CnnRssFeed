//
//  ChannelsModel.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

struct ChannelModel {
    let name:String
    let url:String
    
    static let baseUrl = "http://rss.cnn.com/rss/"
    static var channels:[(String,String)] {
        get {
            return [ ("Top Stories","edition.rss"), ("Africa","edition_africa.rss"),("Americas","edition_americas.rss"),("Asia","edition_asia.rss"),
          ("Europe","edition_europe.rss"),("Middle East","edition_meast.rss"), ("U.S.","edition_us.rss"), ("Money","money_news_international.rss"),
          ("Technology","edition_technology.rss"), ("Science & Space","edition_space.rss"),("Entertainment","edition_entertainment.rss"),
          ("World Sport","edition_sport.rss"),("Football","edition_football.rss"), ("Golf","edition_golf.rss"), ("Motorsport","edition_motorsport.rss"),
          ("Tennis","edition_tennis.rss"), ("Travel","edition_travel.rss"), ("Video","cnn_freevideo.rss"), ("Most Recent","cnn_latest.rss")]
        }
    }
    static func getChannels() -> Channels {
        var ret:Channels = []
        for elem in channels {
            ret.append(ChannelModel(name: elem.0, url: baseUrl + elem.1))
        }
        return ret
    }
}

typealias Channels = [ChannelModel]

