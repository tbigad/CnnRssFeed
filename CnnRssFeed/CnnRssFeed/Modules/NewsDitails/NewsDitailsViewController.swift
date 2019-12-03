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

}

// MARK: - NewsDitailsViewProtocol

extension NewsDitailsViewController: NewsDitailsViewProtocol {

}
