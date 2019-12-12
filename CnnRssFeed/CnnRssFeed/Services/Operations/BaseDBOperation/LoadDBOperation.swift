//
//  LoadDBOperation.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/12/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation
import CoreData

class LoadDBOperation : BaseDBOperation {
    var result: Result<[NewsDataModel], Error>? = nil
     
    override func main() {
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<NewsDataModel>(entityName: modelEntityName)
        var data:[NewsDataModel]?
        do {
            data = try backgroundContext.fetch(request)
        } catch {
            self.result = .failure(error)
        }
        guard let news = data else {
            return
        }
        result = .success(news)
    }
}
