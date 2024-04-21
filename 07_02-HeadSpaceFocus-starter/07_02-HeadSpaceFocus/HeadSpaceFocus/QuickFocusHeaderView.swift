//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by 민웅킴 on 4/21/24.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    //컨피규어 메서드
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
