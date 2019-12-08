//
//  UIImageExtention.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/8/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit


extension UIImage {
    func resize(newSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }

        return image
    }    
}
