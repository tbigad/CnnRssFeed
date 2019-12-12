//
//  UIImageView.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/3/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL, placeholder: UIImage? = nil) {
        DispatchQueue.global().async { [weak self] in
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self?.setImageInMain(image: image)
        } else {
            self?.setImageInMain(image: placeholder)
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    self?.setImageInMain(image: image)
                }
            }).resume()
            }
        }
    }
    
    private func setImageInMain(image:UIImage?){
        DispatchQueue.main.async {
            self.image = image
        }
    }
}
