//
//  NewsDitailsInteractor.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import VIPERBase

final class NewsDitailsInteractor: VIPERInteractor {

    weak var presenter: NewsDitailsInteractorOutputProtocol!

}

// MARK: - NewsDitailsInteractorProtocol

extension NewsDitailsInteractor: NewsDitailsInteractorProtocol {
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
