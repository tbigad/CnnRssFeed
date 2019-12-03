//
//  ChannelsViewController.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/29/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
import VIPERBase

final class ChannelsViewController: BaseViewController<ChannelsView>, VIPERView {

    var presenter: ChannelsViewControllerOutputProtocol!
    var tableView: UITableView?
    var channelesArray:Channels = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let customView = view as! ChannelsView
        tableView = customView.tableView
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(ChannelsTableViewCell.self, forCellReuseIdentifier: ChannelsTableViewCell.identifier)
        presenter.requestUpdate()
    }

}

// MARK: - ChannelsViewProtocol

extension ChannelsViewController: ChannelsViewControllerProtocol {
    func dataReady(channels: Channels) {
        channelesArray.removeAll()
        channelesArray = channels
        tableView?.reloadData()
    }
}

extension ChannelsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channelesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelsTableViewCell.identifier, for: indexPath)
        let data = channelesArray[indexPath.row]
        cell.textLabel?.text = data.name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.channelesArray[indexPath.row]
        presenter.didTappedCell(url: item.url, name: item.name)
    }
}

 extension ChannelsViewController: UITableViewDelegate {
    
}
