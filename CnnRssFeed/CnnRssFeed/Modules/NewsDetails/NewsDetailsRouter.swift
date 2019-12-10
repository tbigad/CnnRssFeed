//
//  NewsDeitailsRouter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDetailsRouter: VIPERRouter {

    weak var viewController: UIViewController!

}

// MARK: - NewsDitailsRouterProtocol

extension NewsDetailsRouter: NewsDetailsRouterProtocol {
    func openWebPage(urlStr: String) {
        let vc = NewsWebViewBuilder.build(withUrl: urlStr)        
        pushModule(withView: vc)
        
    }
}
