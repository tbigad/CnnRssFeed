//
//  NewsDetailsInteractor.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDetailsInteractor: VIPERInteractor {

    weak var presenter: NewsDetailsInteractorOutputProtocol!

}

// MARK: - NewsDitailsInteractorProtocol

extension NewsDetailsInteractor: NewsDetailsInteractorProtocol {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let imageData = try? Data(contentsOf: url)
        guard let data = imageData else {
            return
        }
        presenter.imageLoaded(imgData: data)
    }
}
