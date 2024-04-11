//
//  KimTableViewCell.swift
//  KimsToDo
//
//  Created by 민웅킴 on 3/30/24.
//

import UIKit

protocol TodoTableViewCellDelegate: AnyObject {
    func didComplete(_ indexPath: IndexPath, _ isOn: Bool)
}

class KimTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: KimTableViewCell.self)
    // == static let reuseIdentifier = "KimTableViewCell"
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var strikeThroughView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    weak var delegate: TodoTableViewCellDelegate?   // weak 이 없으면 뷰컨과 셀 따로 각각 가지고 있는게 됨. 그리고 AnyObject를 상속시켜준다
//    unowned                                       // 참조타입.
    
    //var id: UUID
    
    var indexPath: IndexPath?
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //스위치 값이 바뀌었을 때,
    @IBAction func didComplete(_ sender: UISwitch) {
        //투두를 완료상태로 바꿀거임
        //나 말고 VC가 해줘.
        guard let indexPath = self.indexPath else { return }
        
        delegate?.didComplete(indexPath, sender.isOn)
    }
}
