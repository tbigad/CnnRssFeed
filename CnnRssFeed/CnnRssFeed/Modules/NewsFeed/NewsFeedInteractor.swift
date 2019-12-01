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

}

// MARK: - NewsFeedInteractorProtocol

extension NewsFeedInteractor: NewsFeedInteractorProtocol {

}