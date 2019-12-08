//
//  NewsWebViewInteractor.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsWebViewInteractor: VIPERInteractor {

    weak var presenter: NewsWebViewInteractorOutputProtocol!

}

// MARK: - NewsWebViewInteractorProtocol

extension NewsWebViewInteractor: NewsWebViewInteractorProtocol {

}