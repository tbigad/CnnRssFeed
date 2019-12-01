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
    func requestTitle() {
        view.titleReady(title: self.title)
    }
    
    func requestData() {
        
    }
    

}

// MARK: - NewsFeedInteractorOutputProtocol

extension NewsFeedPresenter: NewsFeedInteractorOutputProtocol {

}