//
//  NewsDitailsViewController.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
import VIPERBase

final class NewsDitailsViewController: BaseViewController<NewsDitailsView>, VIPERView {

    var presenter: NewsDitailsViewOutputProtocol!
    var newsItem:NewsFeedItem?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.requestData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.requestData()
    }
    
    func updateView() {
        let customView = view as? NewsDitailsView
        customView?.titleLabel.text = newsItem?.title
        customView?.dateLabel.text = newsItem?.pubDate
        customView?.descriptionTextView.text = newsItem?.description
    }
}

// MARK: - NewsDitailsViewProtocol

extension NewsDitailsViewController: NewsDitailsViewProtocol {
    func dataReady(data: NewsFeedItem) {
        newsItem = data
        updateView()
    }
}
