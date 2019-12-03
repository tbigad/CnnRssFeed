//
//  NewsFeedContracts.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

// MARK: - View Contract

protocol NewsFeedViewProtocol: class {
    func titleReady(title:String?)
    func newDataReady(data:NewsModel)
    func newDataFail(str:String)
}

// MARK: - View Output Contract

protocol NewsFeedViewOutputProtocol: class {
    func requestTitle()
    func requestData()
    func didTappedCloseButton()
}

// MARK: - Interactor Contract

protocol NewsFeedInteractorProtocol: class {
    func requestNews(url:String)
}

// MARK: - Interactor Output Contract

protocol NewsFeedInteractorOutputProtocol: class {
    func newDataReady(data:NewsModel)
    func newDataFail(str:String)
}

// MARK: - Router Contract

protocol NewsFeedRouterProtocol: class {
    func backToMain()
}
