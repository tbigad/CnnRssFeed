//
//  NewsWebViewView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit
import VIPERBase
import WebKit

final class NewsWebViewView: UIViewController, VIPERView {

    var presenter: NewsWebViewViewOutputProtocol!
    var webView: WKWebView!
    var mainLink:String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.requestUrl()
    }
}

// MARK: - NewsWebViewViewProtocol

extension NewsWebViewView: NewsWebViewViewProtocol {
    func urlReady(url: String) {
        mainLink = url
        let myURL = URL(string:url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

extension NewsWebViewView : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}
