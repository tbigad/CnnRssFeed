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
}

// MARK: - View Output Contract

protocol NewsDitailsViewOutputProtocol: class {
    func requestData()
}

// MARK: - Interactor Contract

protocol NewsDitailsInteractorProtocol: class {

}

// MARK: - Interactor Output Contract

protocol NewsDitailsInteractorOutputProtocol: class {

}

// MARK: - Router Contract

protocol NewsDitailsRouterProtocol: class {

}
