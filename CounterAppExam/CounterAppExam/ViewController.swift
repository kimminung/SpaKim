//
//  ViewController.swift
//  CounterAppExam
//
//  Created by 민웅킴 on 3/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let firstView = UIView()
    private let secondView = UIView()
    
    private var count: Int = 0
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func downButton(_ sender: UIButton) {
        self.count -= 1
//        self.countLabel.text = "\(count)"
        self.refreshTextLabel()
    }
    @IBAction func plusButton(_ sender: UIButton) {
        self.count += 1
//        self.countLabel.text = "\(count)"
        self.refreshTextLabel()
    }
    
    private func refreshTextLabel() {
        self.countLabel.text = String(self.count)
        print(self.count)
    }
    
//
    private let label1 = UILabel()
    private let upButton = UIButton()
//
    override func viewDidLoad() {
      super.viewDidLoad()
        self.refreshTextLabel()
        setUILable()
        setUIButton()
        firstView.backgroundColor = .darkGray
        
        
        
      print("\n---------- [ viewdidload ] ----------\n")
    }
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      print("\n---------- [ viewwillAppear ] ----------\n")
    }
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      print("\n---------- [ viewDidAppear ] ----------\n")
    }
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      print("\n---------- [ viewWillDisappear ] ----------\n")
    }
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      print("\n---------- [ viewDidDisappear ] ----------\n")
    }
    
    
    
    func setUILable() {
        
        label1.text = "code label _ 누르기 전 입니다."
        label1.font = UIFont.systemFont(ofSize: 30)
        label1.textColor = UIColor.lightText
        label1.textAlignment = .left
        label1.numberOfLines = 2
        label1.lineBreakMode = .byCharWrapping
        
        label1.frame = CGRect(x: 50, y: 50, width: view.bounds.width - 100 , height: view.bounds.height - 100 )
        
        label1.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.addSubview(label1)
    }
    
    private func activateNSLayoutConstraintConstraints() {
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: label1, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 50
        ).isActive = true
        
        NSLayoutConstraint(item: label1, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50
        ).isActive = true
        
        NSLayoutConstraint(item: label1, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50
        ).isActive = true
        
        NSLayoutConstraint(item: label1, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50
        ).isActive = true
    }
    
    
    
    
    func setUIButton() {
        
        upButton.setTitle("+", for: .normal)
        upButton.backgroundColor = UIColor.clear
        upButton.setTitleColor(UIColor.lightGray, for: .normal)
        upButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        upButton.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.view.addSubview(upButton)
    }
    
    @objc func buttonTapped() {
        label1.text = "CODE:1"
        print("taptap")
    }
    


}

