//
//  NewsFeedView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsFeedView: BaseView {
    lazy var closeButton:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
    lazy var tableView:UITableView = UITableView()
    var buttonBottomAnchor:NSLayoutConstraint!
    
    override func setupLayout() {
        closeButton.setImage(UIImage(named: "close"), for: .normal)
        tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        closeButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        tableView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
        closeButton.heightAnchor.constraint(equalToConstant: 75),
        closeButton.widthAnchor.constraint(equalToConstant: 75)])
        
        
        buttonBottomAnchor = closeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        buttonBottomAnchor.isActive = true
        
    }
    
    override func addSubviews() {
        addSubview(tableView)
        addSubview(closeButton)
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
    }
}
