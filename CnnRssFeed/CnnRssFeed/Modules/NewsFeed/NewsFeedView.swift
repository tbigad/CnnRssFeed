//
//  NewsFeedView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsFeedView: BaseView {
    lazy var closeButton:UIButton = UIButton()
    lazy var tableView:UITableView = UITableView()
    
    override func setupLayout() {
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
    override func addSubviews() {
        addSubview(tableView)
        addSubview(closeButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonWidth = tableView.bounds.size.width/5
        closeButton.frame = CGRect(x: 0, y: tableView.bounds.size.height, width: buttonWidth, height: buttonWidth)
    }
    
}
