//
//  NewsFeedPresenter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsFeedPresenter: VIPERPresenter {

    weak var view: NewsFeedViewProtocol!
    var interactor: NewsFeedInteractorProtocol!
    var router: NewsFeedRouterProtocol!
    var channelUrl:String?
    var title:String?
}

// MARK: - NewsFeedViewOutputProtocol

extension NewsFeedPresenter: NewsFeedViewOutputProtocol {
    func didTappedTibleItem(withItem: NewsFeedItem) {
        router.toNewsDitails(withItem: withItem)
    }
    
    func didTappedCloseButton() {
        router.backToMain()
    }
    
    func requestTitle() {
        view.titleReady(title: self.title)
    }
    
    func requestData() {
        guard let url = channelUrl else {
            return
        }
        interactor.requestNews(url: url)
    }
}

// MARK: - NewsFeedInteractorOutputProtocol

extension NewsFeedPresenter: NewsFeedInteractorOutputProtocol {
    func newDataReady(data: NewsModel) {
        view?.newDataReady(data: data)
    }
    
    func newDataFail(str: String) {
        view.newDataFail(str: str)
    }
}
