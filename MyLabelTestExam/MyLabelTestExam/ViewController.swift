//
//  ViewController.swift
//  MyLabelTestExam
//
//  Created by 민웅킴 on 3/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    
    @IBAction func tappedButton(_ sender: Any) {
        self.textLabel3.text = "버튼 클릭했습니다"
        let button = sender as? UIButton
        button?.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

