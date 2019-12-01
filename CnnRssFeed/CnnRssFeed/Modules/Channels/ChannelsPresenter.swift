//
//  ChannelsPresenter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class ChannelsPresenter: VIPERPresenter {

    weak var view: ChannelsViewControllerProtocol!
    var interactor: ChannelsInteractorProtocol!
    var router: ChannelsRouterProtocol!

}

// MARK: - ChannelsViewOutputProtocol

extension ChannelsPresenter: ChannelsViewControllerOutputProtocol {
    func requestUpdate() {
        interactor.requestUpdate()
    }
    
    func didTappedCell(url: String, name: String) {
        router.goToNewsFeed(withChannelUrl: url, name: name)
    }
    
}

// MARK: - ChannelsInteractorOutputProtocol

extension ChannelsPresenter: ChannelsInteractorOutputProtocol {
    func dataReady(channels: Channels) {
        view.dataReady(channels: channels)
    }
}
