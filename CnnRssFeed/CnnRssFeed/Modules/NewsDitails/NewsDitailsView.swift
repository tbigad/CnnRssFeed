//
//  NewsDitailsView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsDitailsView: BaseView {
    
    lazy var titleLabel = UILabel()
    lazy var dateLabel = UILabel()
    lazy var textView = UITextView()
    lazy var linkButton = UIButton()
    lazy var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.numberOfLines = 0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupLayout() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        titleLabel.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        textView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        linkButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        linkButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        stackView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        NSLayoutConstraint.activate(
        [stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
        
//        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
//        dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
//        dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
//        textView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        textView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
//        textView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
//        linkButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        linkButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8).isActive = true
//        linkButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
//        linkButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        
    }
    
    override func addSubviews() {
        addSubview(stackView)
        stackView.addSubview(titleLabel)
        stackView.addSubview(dateLabel)
        stackView.addSubview(textView)
        stackView.addSubview(linkButton)
    }
}
