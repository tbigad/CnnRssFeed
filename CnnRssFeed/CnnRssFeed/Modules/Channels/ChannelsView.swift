//
//  ChannelsView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/27/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import UIKit

class ChannelsView: BaseView {
    let tableView:UITableView = UITableView()
    override func addSubviews() {
        backgroundColor = UIColor.white
        addSubview(tableView)
    }

    override func setupLayout() {
        tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
}
