//
//  ChannelsContracts.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

// MARK: - View Contract

protocol ChannelsViewControllerProtocol: class {
    func dataReady(channels:Channels)
}

// MARK: - View Output Contract

protocol ChannelsViewControllerOutputProtocol: class {
    func requestUpdate()
    func didTappedCell(url:String, name:String)
}

// MARK: - Interactor Contract

protocol ChannelsInteractorProtocol: class {
    func requestUpdate()
}

// MARK: - Interactor Output Contract

protocol ChannelsInteractorOutputProtocol: class {
    func dataReady(channels:Channels)
}

// MARK: - Router Contract

protocol ChannelsRouterProtocol: class {
    func goToNewsFeed(withChannelUrl:String, name: String)
}
