//
//  ChannelsInteractor.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class ChannelsInteractor: VIPERInteractor {

    weak var presenter: ChannelsInteractorOutputProtocol!

}

// MARK: - ChannelsInteractorProtocol

extension ChannelsInteractor: ChannelsInteractorProtocol {
    func requestUpdate() {
        let channels = ChannelModel.getChannels()
        presenter.dataReady(channels: channels)
    }
}
