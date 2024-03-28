//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 민웅킴 on 3/28/24.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1 //1줄만 쓸건데
        nameLabel.adjustsFontSizeToFitWidth = true  //폰트 사이즈좀 맞춰줘라
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image =
        UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
