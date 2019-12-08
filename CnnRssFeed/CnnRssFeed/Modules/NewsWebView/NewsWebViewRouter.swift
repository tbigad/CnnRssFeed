//
//  NewsWebViewRouter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsWebViewRouter: VIPERRouter {

    weak var viewController: UIViewController!

}

// MARK: - NewsWebViewRouterProtocol

extension NewsWebViewRouter: NewsWebViewRouterProtocol {

}