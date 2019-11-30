//
//  ChannelsModel.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

struct ChanelModel {
    let name:String
    let url:String
    

    static func getChannels() -> Channels {
        var ret:Channels = []
        ret.append(ChanelModel(name:"Top Stories", url:"http://rss.cnn.com/rss/edition.rss" ))
        ret.append(ChanelModel(name:"Africa", url:"http://rss.cnn.com/rss/edition_africa.rss" ))
        ret.append(ChanelModel(name:"Americas", url:"http://rss.cnn.com/rss/edition_americas.rss" ))
        ret.append(ChanelModel(name:"Asia", url:"http://rss.cnn.com/rss/edition_asia.rss" ))
        ret.append(ChanelModel(name:"Europe", url:"http://rss.cnn.com/rss/edition_europe.rss" ))
        ret.append(ChanelModel(name:"Middle East", url:"http://rss.cnn.com/rss/edition_meast.rss" ))
        ret.append(ChanelModel(name:"U.S.", url:"http://rss.cnn.com/rss/edition_us.rss" ))
        ret.append(ChanelModel(name:"Money", url:"http://rss.cnn.com/rss/money_news_international.rss" ))
        ret.append(ChanelModel(name:"Technology", url:"http://rss.cnn.com/rss/edition_technology.rss" ))
        ret.append(ChanelModel(name:"Science & Space ", url:"http://rss.cnn.com/rss/edition_space.rss" ))
        ret.append(ChanelModel(name:"Entertainment", url:"http://rss.cnn.com/rss/edition_entertainment.rss" ))
        ret.append(ChanelModel(name:"World Sport", url:"http://rss.cnn.com/rss/edition_sport.rss" ))
        ret.append(ChanelModel(name:"Football", url:"http://rss.cnn.com/rss/edition_football.rss" ))
        ret.append(ChanelModel(name:"Golf", url:"http://rss.cnn.com/rss/edition_golf.rss" ))
        ret.append(ChanelModel(name:"Motorsport", url:"http://rss.cnn.com/rss/edition_motorsport.rss" ))
        ret.append(ChanelModel(name:"Tennis", url:"http://rss.cnn.com/rss/edition_tennis.rss" ))
        ret.append(ChanelModel(name:"Travel", url:"http://rss.cnn.com/rss/edition_travel.rss" ))
        ret.append(ChanelModel(name:"Video", url:"http://rss.cnn.com/rss/cnn_freevideo.rss" ))
        ret.append(ChanelModel(name:"Most Recent", url:"http://rss.cnn.com/rss/cnn_latest.rss" ))
        return ret
    }
}

typealias Channels = [ChanelModel]

