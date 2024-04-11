//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by 민웅킴 on 4/11/24.
//

import UIKit

class ResultCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //셀 재사용(Reuse)되기 전에 준비(prepare)하는 함수
    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }
    
    //이미지의 이름을 받으면 이미지 출력
    func configure(_ imageName: String) {
        thumbnailImageView.image =
        UIImage(named: imageName)
    }
    
}
