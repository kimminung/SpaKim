//
//  OnboardingCell.swift
//  NRCOnboarding
//
//  Created by 민웅킴 on 4/17/24.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
 
    func configure(_ message: OnboardingMessage)
    {
        thumbnailImageView.image = UIImage(named: message.imageName)
        titleLabel.text = message.title
        descriptionLabel.text = message.description
    }
    
}
