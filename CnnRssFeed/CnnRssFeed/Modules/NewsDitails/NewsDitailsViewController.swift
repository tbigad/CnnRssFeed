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
        let customView = view as? NewsDitailsView
        customView?.ditailsButton.addTarget(self, action: #selector(didTappedDitailsButton), for: .touchUpInside)
    }
    
    func updateView() {
        let customView = view as? NewsDitailsView
        customView?.titleLabel.text = newsItem?.title
        customView?.dateLabel.text = newsItem?.pubDate
        customView?.descriptionTextView.text = newsItem?.description
        customView?.ditailsButton.isHidden = newsItem?.link == nil
    }
    
    @objc func didTappedDitailsButton(){
        guard let url = newsItem?.link else {
            return
        }
        presenter.didTappedDitailsButton(url: url)
    }
}

// MARK: - NewsDitailsViewProtocol

extension NewsDitailsViewController: NewsDitailsViewProtocol {
    func imageReady(imgData: Data) {
        guard let str = newsItem?.description, let image = UIImage(data: imgData) else {
            return
        }
        
        let imgSize = image.size
        let maxWidth = UIScreen.main.bounds.width/2
        let scaleFactor = maxWidth / imgSize.width
        let newImageSize = CGSize(width: imgSize.width*scaleFactor, height: imgSize.height*scaleFactor)
        let imageToAttach = image.resize(newSize: newImageSize)
        let customView = view as? NewsDitailsView
        let imageRect = CGRect(origin: CGPoint(x: 0, y: 0), size: imageToAttach.size)
        
        let imageFrame = UIBezierPath(rect: imageRect)
        customView?.descriptionTextView.textContainer.exclusionPaths = [imageFrame]
        customView?.descriptionTextView.text = str
        customView?.imageView.image = imageToAttach
        customView?.imageView.frame = imageRect
        customView?.setNeedsLayout()
    }
    
    func dataReady(data: NewsFeedItem) {
        newsItem = data
        updateView()
        guard let urlStr = newsItem?.getSmallestMedia()?.key else {
            return
        }
        presenter.requestImage(url: urlStr)
    }
}
