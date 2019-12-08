//
//  NewsWebViewPresenter.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsWebViewPresenter: VIPERPresenter {

    weak var view: NewsWebViewViewProtocol!
    var interactor: NewsWebViewInteractorProtocol!
    var router: NewsWebViewRouterProtocol!
    var urlStr:String?
}

// MARK: - NewsWebViewViewOutputProtocol

extension NewsWebViewPresenter: NewsWebViewViewOutputProtocol {
    func requestUrl() {
        guard let str = urlStr else {
            return
        }
        view.urlReady(url: str)
    }
}

// MARK: - NewsWebViewInteractorOutputProtocol

extension NewsWebViewPresenter: NewsWebViewInteractorOutputProtocol {

}
