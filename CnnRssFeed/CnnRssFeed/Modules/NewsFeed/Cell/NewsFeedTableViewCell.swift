//
//  NewsFeedTableViewCell.swift
//  CnnRssFeed
//
//  Created by Pavel N on 12/2/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    lazy var newsImage:UIImageView = UIImageView()
    lazy var newsTitle:UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImage)
        addSubview(newsTitle)
        
        newsTitle.adjustsFontSizeToFitWidth = true
        newsTitle.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let targetSize = self.bounds.size
        newsImage.frame = CGRect(origin: CGPoint(x: targetSize.width - targetSize.height - 16, y: 0)
            , size: CGSize(width: targetSize.height, height: targetSize.height))
        newsTitle.frame = CGRect(origin: CGPoint(x: 8, y: 0)
        , size: CGSize(width: targetSize.width - targetSize.height - 16, height: targetSize.height))
    }
}
