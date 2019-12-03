//
//  NewsFeedViewController.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/30/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
import VIPERBase

final class NewsFeedViewController: BaseViewController<NewsFeedView>, VIPERView {
    var presenter: NewsFeedViewOutputProtocol!
    
    private var newsModel:NewsModel = []
    weak private var tableView:UITableView?
    override func viewDidLoad() {
        presenter.requestTitle()
        presenter.requestData()
        let customView = view as! NewsFeedView
        customView.closeButton.addTarget(self, action: #selector(closeButtonDidTapped), for: .touchUpInside)
        tableView = customView.tableView
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(NewsFeedTableViewCell.self, forCellReuseIdentifier: NewsFeedTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.requestData()
    }
    
    @objc func closeButtonDidTapped() {
        self.dismiss(animated: true, completion: {
        })
        self.presenter.didTappedCloseButton()
    }
}

// MARK: - NewsFeedViewProtocol

extension NewsFeedViewController: NewsFeedViewProtocol {
    func newDataReady(data: NewsModel) {
        DispatchQueue.main.async {
            [weak self] in
            self?.newsModel = data
            self?.tableView?.reloadData()
        }
    }
    
    func newDataFail(str: String) {
        DispatchQueue.main.async {
            self.showAlertMessage(title: "Error", message: str, handle: {})
        }
    }
    
    func titleReady(title: String?) {
        self.title = title
    }
}

extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedTableViewCell.identifier, for: indexPath) as! NewsFeedTableViewCell
        let item = newsModel[indexPath.row]
        cell.newsTitle.text = item.title
        
        guard let str = item.media.first, let url = URL(string: str) else {
            return cell
        }
        cell.newsImage.load(url: url)
        cell.setNeedsLayout()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.newsModel[indexPath.row]
        presenter.didTappedTibleItem(withItem: item)
    }
}
