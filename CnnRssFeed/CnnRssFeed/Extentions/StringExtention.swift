//
//  StringExtention.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/7/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import Foundation

extension String{
    var htmlStripped : String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
