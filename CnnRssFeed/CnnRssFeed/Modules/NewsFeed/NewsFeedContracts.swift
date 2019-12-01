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
}

// MARK: - View Output Contract

protocol NewsFeedViewOutputProtocol: class {
    func requestTitle()
    func requestData()
}

// MARK: - Interactor Contract

protocol NewsFeedInteractorProtocol: class {

}

// MARK: - Interactor Output Contract

protocol NewsFeedInteractorOutputProtocol: class {

}

// MARK: - Router Contract

protocol NewsFeedRouterProtocol: class {

}
