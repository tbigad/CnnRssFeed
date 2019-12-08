//
//  NewsWebViewContracts.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

// MARK: - View Contract

protocol NewsWebViewViewProtocol: class {
    func urlReady(url:String)
}

// MARK: - View Output Contract

protocol NewsWebViewViewOutputProtocol: class {
    func requestUrl()
}

// MARK: - Interactor Contract

protocol NewsWebViewInteractorProtocol: class {

}

// MARK: - Interactor Output Contract

protocol NewsWebViewInteractorOutputProtocol: class {

}

// MARK: - Router Contract

protocol NewsWebViewRouterProtocol: class {

}
