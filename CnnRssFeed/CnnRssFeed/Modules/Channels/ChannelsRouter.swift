//
//  ChannelsRouter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class ChannelsRouter: VIPERRouter {

    weak var viewController: UIViewController!

}

// MARK: - ChannelsRouterProtocol

extension ChannelsRouter: ChannelsRouterProtocol {
    func goToNewsFeed(withChannelUrl: String, name: String) {
        let module = NewsFeedBuilder.build(withChannelUrl: withChannelUrl, name: name)
        presentModule(withView: module.view, embedIn: .navigationController, animated: true, completion: {})
    }    
}
