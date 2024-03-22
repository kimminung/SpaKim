//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["play.rectangle.fill", "signature", "bolt.heart", "arrowshape.up", "compass.drawing"]

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() { // 메모리 올라가고
        super.viewDidLoad()
//        button.tintColor = UIColor.systemCyan
        
        //To - Do:
        // 심볼에서 하나를 임의로 추출
        // 이미지와 텍스트를 설정한다
        // DRY
        reload()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) { //보여줄거다
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) { // 보여줬다
        super.viewDidAppear(animated)
    }
    
    func reload() {
        let symbol = symbols.randomElement()!
        
        imageView.image = UIImage(systemName: symbol) //실행하고
        label.text = symbol
    }

    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }
    

}
