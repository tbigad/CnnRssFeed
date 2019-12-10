//
//  NewsFeedRouter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsFeedRouter: VIPERRouter {

    weak var viewController: UIViewController!

}

// MARK: - NewsFeedRouterProtocol

extension NewsFeedRouter: NewsFeedRouterProtocol {
    func toNewsDitails(withItem: NewsFeedItem) {
        let module = NewsDetailsBuilder.build(withNewsItem: withItem)
        pushModule(withView: module.view)
    }
    
    func backToMain() {
        viewController.dismiss(animated: true, completion: {})
    }
}
