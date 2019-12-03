//
//  NewsDitailsPresenter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDitailsPresenter: VIPERPresenter {

    weak var view: NewsDitailsViewProtocol!
    var interactor: NewsDitailsInteractorProtocol!
    var router: NewsDitailsRouterProtocol!
    var newsItem:NewsFeedItem?
}

// MARK: - NewsDitailsViewOutputProtocol

extension NewsDitailsPresenter: NewsDitailsViewOutputProtocol {

}

// MARK: - NewsDitailsInteractorOutputProtocol

extension NewsDitailsPresenter: NewsDitailsInteractorOutputProtocol {

}
