//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 민웅킴 on 3/26/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(_ chat: Chat ) {
        thumbnail.image = UIImage(named: chat.name)
        namelabel.text = chat.name
        chatLabel.text = chat.chat
//        dateLabel.text = chat.date
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
        
        //String -> Date -> String
        // 2022-04-01 > 4/1
        //이걸 해주는 객체가 DateFormatter()다.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //문자열 -> date
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
