//
//  GetNewsAsyncOperation.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/2/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
enum GetNewsAsyncOperationResult {
    case succes(NewsModel)
    case fail(String)
}


class GetNewsAsyncOperation:AsyncOperation {
    var result:GetNewsAsyncOperationResult?
    
    private var rssUrl:String?
    private var backendOperation:OperationQueue?
    private var loadNewsBackendOperation:LoadNewsBackendOperation?
    
    init(withUrl:String) {
        rssUrl = withUrl
    }
    
    override func main() {
        getNews()
    }
    
    func getNews() {
        guard let url = rssUrl else { return }
        backendOperation = OperationQueue()
        loadNewsBackendOperation = LoadNewsBackendOperation(withUrl: url)
        guard let loadOp = loadNewsBackendOperation, let queue = backendOperation else { return }
        loadOp.completionBlock = {
            [weak self, weak loadOp] in
            guard let result = loadOp?.result else {
                self?.finish()
                return
            }
            switch result {
            case .error(let str):
                self?.result = .fail(str)
            case .succed(let model):
                self?.result = .succes(model)
            }
            self?.finish()
        }
        addDependency(loadOp)
        queue.addOperation(loadOp)
    }
}
