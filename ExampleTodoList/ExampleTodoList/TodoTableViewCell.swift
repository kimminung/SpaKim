//
//  TodoTableViewCell.swift
//  ExampleTodoList
//
//  Created by woochan on 3/28/24.
//

import UIKit

// delegation

// closure

protocol TodoTableViewCellDelegate: AnyObject {
  func didComplete(_ indexPath: IndexPath, _ isOn: Bool)
}

class TodoTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = "TodoTableViewCell"

  @IBOutlet weak var title: UILabel!
  
  @IBOutlet weak var dateLabel: UILabel!
  
  @IBOutlet weak var `switch`: UISwitch!
  
  @IBOutlet weak var strikeThroughView: UIView!
  
  weak var delegate: TodoTableViewCellDelegate?

  var indexPath: IndexPath?
  
  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }
  
  /// 스위치 값이 바뀌었을 때,
  /// 1. off -> on
  /// 2. on -> off
  @IBAction func didComplete(_ sender: UISwitch) {
    // 투두를 완료상태로 바꿀거임 (나말고 너가 `해줘`)
    
    guard let indexPath = self.indexPath else { return }
    
    delegate?.didComplete(indexPath, sender.isOn)
    
  }
}
