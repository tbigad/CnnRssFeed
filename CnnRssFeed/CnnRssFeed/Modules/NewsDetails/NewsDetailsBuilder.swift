//
//  NewsDetailsBuilder.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDetailsBuilder: VIPERBuilder<NewsDetailsViewController, NewsDetailsPresenter, NewsDetailsInteractor, NewsDetailsRouter> {

}

// MARK: - Builder custom methods

extension NewsDetailsBuilder {
        static func build(withNewsItem item: NewsFeedItem) -> VIPERModule<NewsDetailsViewController, NewsDetailsPresenter, NewsDetailsInteractor, NewsDetailsRouter>  {
        let module = build()
        module.presenter.newsItem = item
        return module
    }
}
