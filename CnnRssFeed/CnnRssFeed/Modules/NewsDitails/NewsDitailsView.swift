//
//  NewsDitailsView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsDitailsView: BaseView {
    lazy var ditailsButton = UIButton(type: .system)
    lazy var descriptionTextView = UITextView()
    lazy var dateLabel = UILabel()
    lazy var titleLabel = UILabel()
    lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel, descriptionTextView,ditailsButton])
    
    override func setupLayout() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        dateLabel.textAlignment = .left
        descriptionTextView.isScrollEnabled = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }
    
    override func addSubviews() {
        ditailsButton.setTitle("Ditails", for: .normal)
        addSubview(stackView)
    }
    
}
