//
//  NewsFeedViewController.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
import VIPERBase

final class NewsFeedViewController: BaseViewController<NewsFeedView>, VIPERView {

    var presenter: NewsFeedViewOutputProtocol!
    override func viewDidLoad() {
        presenter.requestTitle()
    }
}

// MARK: - NewsFeedViewProtocol

extension NewsFeedViewController: NewsFeedViewProtocol {
    func titleReady(title: String?) {
        self.title = title
    }
}
