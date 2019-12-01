//
//  NewsFeedBuilder.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsFeedBuilder: VIPERBuilder<NewsFeedViewController, NewsFeedPresenter, NewsFeedInteractor, NewsFeedRouter> {
}

// MARK: - Builder custom methods

extension NewsFeedBuilder {
    static func build(withChannelUrl channelUrl: String, name:String) -> VIPERModule<NewsFeedViewController, NewsFeedPresenter, NewsFeedInteractor, NewsFeedRouter>  {
        let module = build()
        module.presenter.channelUrl = channelUrl
        module.presenter.title = name
        return module
    }
}
