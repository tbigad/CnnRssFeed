//
//  NewsDitailsBuilder.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDitailsBuilder: VIPERBuilder<NewsDitailsViewController, NewsDitailsPresenter, NewsDitailsInteractor, NewsDitailsRouter> {

}

// MARK: - Builder custom methods

extension NewsDitailsBuilder {
        static func build(withNewsItem item: NewsFeedItem) -> VIPERModule<NewsDitailsViewController, NewsDitailsPresenter, NewsDitailsInteractor, NewsDitailsRouter>  {
        let module = build()
        module.presenter.newsItem = item
        return module
    }
}
