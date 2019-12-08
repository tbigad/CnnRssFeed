//
//  NewsWebViewBuilder.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsWebViewBuilder: VIPERBuilder<NewsWebViewView, NewsWebViewPresenter, NewsWebViewInteractor, NewsWebViewRouter> {

}

// MARK: - Builder custom methods

extension NewsWebViewBuilder {
    static func build(withUrl url: String) -> UIViewController  {
        let module = build()
        module.presenter.urlStr = url
        return module.view
    }
}
