//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by 민웅킴 on 4/19/24.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    } //작성하고나면 뷰컨에 가서 vc의 프레임웍을 업데이트 해야함.
    //vc.framework = framework

    @IBAction func learnMoreTapped(_ sender: Any) {
        
        guard let url = URL(string: framework.urlString) else {return}
        
        let safari = SFSafariViewController(url: url)
        
        present(safari, animated: true)
    }
}
