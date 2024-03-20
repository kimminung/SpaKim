//
//  TableViewCell.swift
//  KimsTodoListMemoji
//
//  Created by 민웅킴 on 3/20/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
      super.awakeFromNib()
      print("\n---------- [ awakeFromNib ] ----------\n")
    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
      print("\n---------- [ prepareForReuse ] ----------\n")
    }
    
    deinit {
      print("\n---------- [ deinit ] ----------\n")
    }
}
