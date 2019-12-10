//
//  NewsDetailsView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsDetailsView: BaseView {
    lazy var ditailsButton = UIButton(type: .system)
    lazy var descriptionTextView = UITextView()
    lazy var dateLabel = UILabel()
    lazy var titleLabel = UILabel()
    lazy var stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel, descriptionTextView,ditailsButton])
    lazy var imageView = UIImageView()
    
    override func setupLayout() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        dateLabel.textAlignment = .left
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        descriptionTextView.font = UIFont.preferredFont(forTextStyle: .caption2)
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.isPagingEnabled = false
        descriptionTextView.isDirectionalLockEnabled = false
        descriptionTextView.showsVerticalScrollIndicator = false
        descriptionTextView.showsHorizontalScrollIndicator = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.spacing = 8.0
        NSLayoutConstraint.activate(
            [stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
             stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0),
             stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8.0)])
    }
    
    override func addSubviews() {
        ditailsButton.setTitle("Details", for: .normal)
        addSubview(stackView)
        descriptionTextView.addSubview(imageView)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
}
