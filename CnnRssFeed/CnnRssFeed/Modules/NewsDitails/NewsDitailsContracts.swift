//
//  NewsDitailsContracts.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

// MARK: - View Contract

protocol NewsDitailsViewProtocol: class {
    func dataReady(data:NewsFeedItem)
    func imageReady(imgData:Data)
}

// MARK: - View Output Contract

protocol NewsDitailsViewOutputProtocol: class {
    func requestImage(str:String)
    func requestData()
}

// MARK: - Interactor Contract

protocol NewsDitailsInteractorProtocol: class {
    func loadImage(urlString:String)
}

// MARK: - Interactor Output Contract

protocol NewsDitailsInteractorOutputProtocol: class {
    func imageLoaded(imgData:Data)
}

// MARK: - Router Contract

protocol NewsDitailsRouterProtocol: class {

}
