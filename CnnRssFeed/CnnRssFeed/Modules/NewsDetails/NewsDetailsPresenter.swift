//
//  NewsDetailsPresenter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDetailsPresenter: VIPERPresenter {

    weak var view: NewsDetailsViewProtocol!
    var interactor: NewsDetailsInteractorProtocol!
    var router: NewsDetailsRouterProtocol!
    var newsItem:NewsFeedItem?
}

// MARK: - NewsDitailsViewOutputProtocol

extension NewsDetailsPresenter: NewsDetailsViewOutputProtocol {
    func didTappedDitailsButton(url: String) {
        router.openWebPage(urlStr: url)
    }

    func requestImage(url: String) {
        interactor.loadImage(urlString: url)
    }
    
    func requestData() {
        guard let item = newsItem else { return }
        view.dataReady(data: item)
    }
}

// MARK: - NewsDitailsInteractorOutputProtocol

extension NewsDetailsPresenter: NewsDetailsInteractorOutputProtocol {
    func imageLoaded(imgData: Data) {
        view.imageReady(imgData: imgData)
    }
}
