//
//  TableViewCell.swift
//  KimsTodoListMemoji
//
//  Created by 민웅킴 on 3/20/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var numButton: UILabel!
    @IBOutlet weak var textLabels: UILabel!
    @IBOutlet weak var onOff: UISwitch!
    
    
    @IBAction func todoSwitchAction(_ sender: UISwitch) {
        if onOff.isOn != true {
            textLabels.attributedText = textLabels.text?.strikeThrough()
        } else {
            textLabels.attributedText = NSAttributedString(string: textLabels.text ?? "")
        }
    }
    
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
    
    func configure(_ todo: Todo) {
        numButton.text = String(todo.todoID)
        textLabels.text = todo.todoTitle
        onOff.isOn = todo.isCompleted
    }
    
}

extension String {
    // MARK: - 밑줄
    func underScore() -> NSAttributedString {
        let underScore = NSMutableAttributedString(string: self)
        // 전체 문자열에 밑줄 스타일 속성을 추가
        underScore.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, underScore.length))
        return underScore
    }
    // MARK: - 가운데 밑줄
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)

        // 전체 문자열에 가운데 밑줄 스타일 속성을 추가
        // NSAttributedString.Key를 사용하여 서식과 속성을 적용할 수 있음(NSAttributedString.Key.strikethroughStyle을 .strikethroughStyle로 사용 가능)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
