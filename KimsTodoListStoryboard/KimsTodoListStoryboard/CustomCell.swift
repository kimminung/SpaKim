//
//  CustomCell.swift
//  KimsTodoListStoryboard
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var imageClick: UIImageView!
    @IBOutlet weak var textLabels: UILabel!
    @IBAction func onOff(_ sender: UISwitch) {
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
