//
//  NewsDetailsContracts.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

// MARK: - View Contract

protocol NewsDetailsViewProtocol: class {
    func dataReady(data:NewsFeedItem)
    func imageReady(imgData:Data)
}

// MARK: - View Output Contract

protocol NewsDetailsViewOutputProtocol: class {
    func requestImage(url:String)
    func requestData()
    func didTappedDitailsButton(url:String)
}

// MARK: - Interactor Contract

protocol NewsDetailsInteractorProtocol: class {
    func loadImage(urlString:String)
}

// MARK: - Interactor Output Contract

protocol NewsDetailsInteractorOutputProtocol: class {
    func imageLoaded(imgData:Data)
}

// MARK: - Router Contract

protocol NewsDetailsRouterProtocol: class {
    func openWebPage(urlStr:String)
}
