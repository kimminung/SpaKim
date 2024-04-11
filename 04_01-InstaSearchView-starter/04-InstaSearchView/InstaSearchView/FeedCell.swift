//
//  FeedCell.swift
//  InstaSearchView
//
//  Created by 민웅킴 on 4/11/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
