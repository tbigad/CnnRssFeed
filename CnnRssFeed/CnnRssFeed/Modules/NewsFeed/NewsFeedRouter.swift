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
    func backToMain() {
        let module = ChannelsBuilder.build()
        let window = UIApplication.shared.windows.first
        window?.rootViewController = module.view
        window?.makeKeyAndVisible()
    }
}
