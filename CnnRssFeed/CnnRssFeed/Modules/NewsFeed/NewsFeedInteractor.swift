//
//  NewsFeedInteractor.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsFeedInteractor: VIPERInteractor {

    weak var presenter: NewsFeedInteractorOutputProtocol!
    var backendQueue:OperationQueue?

}

// MARK: - NewsFeedInteractorProtocol

extension NewsFeedInteractor: NewsFeedInteractorProtocol {
    func requestNews(url: String) {
        backendQueue = OperationQueue()
        let getNewsAsyncOperation = GetNewsAsyncOperation(withUrl: url)
        guard let queue = backendQueue else { return }
        getNewsAsyncOperation.completionBlock = {
            [weak self, weak getNewsAsyncOperation] in
            guard let result = getNewsAsyncOperation?.result else { return }
            switch result {
            case .succes(let data):
                self?.presenter.newDataReady(data: data)
            case .fail(let str):
                self?.presenter.newDataFail(str: str)
            }
        }
        queue.addOperation(getNewsAsyncOperation)
        
    }
}
