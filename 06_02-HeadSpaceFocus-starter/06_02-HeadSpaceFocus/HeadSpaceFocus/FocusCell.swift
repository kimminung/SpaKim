//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by 민웅킴 on 4/18/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    
    //data를 받아서 UIComponent 업데이트 해주는 컨피규어 작성
    
    func configure(_ item: Focus) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
            //(.alwaysTemplate)은 디폴트..컬러는 무시하고 형태만 씀. 컬러는 기본 틴트값
    }
}
