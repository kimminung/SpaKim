//
//  ViewController.swift
//  MyAction
//
//  Created by 민웅킴 on 1/16/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var helloLavel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapMyButton(_ sender: Any) {
        print("배경을 노랑으로 바꿈")
        
        view.backgroundColor = .yellow
        helloLavel.text = "헬로"
    }
    

}

