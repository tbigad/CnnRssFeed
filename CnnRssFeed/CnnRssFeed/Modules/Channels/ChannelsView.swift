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
        backgroundColor = UIColor.clear
        addSubview(tableView)
    }

    override func setupLayout() {
        tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        NSLayoutConstraint.activate(
        [tableView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
        tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
        tableView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0),
        tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0)])
    }
}
