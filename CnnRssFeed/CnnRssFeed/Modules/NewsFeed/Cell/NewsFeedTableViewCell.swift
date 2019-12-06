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
        newsImage.contentMode = .scaleToFill
        newsImage.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        newsImage.layer.cornerRadius = 8.0
        newsImage.clipsToBounds = true
        super.layoutSubviews()
        let targetSize = self.safeAreaLayoutGuide.layoutFrame
        let imageWH = targetSize.height - 8
        newsImage.frame = CGRect(origin: CGPoint(x: targetSize.width - targetSize.height - 8, y: self.safeAreaLayoutGuide.layoutFrame.midY - imageWH/2)
            , size: CGSize(width:imageWH , height: imageWH))
        newsTitle.frame = CGRect(origin: CGPoint(x: 8, y: 0)
        , size: CGSize(width: targetSize.width - targetSize.height - 20, height: targetSize.height))
    }
}
