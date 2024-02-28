//
//  ViewController.swift
//  MyPracticeUI
//
//  Created by 민웅킴 on 1/17/24.
//

import UIKit

struct Family {
    let myName: String
    let bestFriendName: String
    let nextFriendName: String
    let myBrother: String
}

class ViewController: UIViewController {

    let friendsNames: [String] = ["Henry", "Kim", "Jay", "Key"]
    let koreanNames: [String: String] = ["Henry": "헨리", "Kim": "김", "Jay": "제이"]
    var count: Int = 0
    let friend = Family(myName: "Henry2", bestFriendName: "Kim2", nextFriendName: "Jay2", myBrother: "Key")
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bestFriendNameLabel: UILabel!
    @IBOutlet weak var nextFriendNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        
        view.backgroundColor = .yellow
    }

    @IBAction func didTapButton(_ sender: Any) {
//        nameLabel.text = "Hello!"
        /*
         nameLabel.text = friendsNames[count]
        count = count + 1
         */
        
        
        /*
        let friendName = friendsNames[count]
        //하지만
        nameLabel.text = koreanNames[friendName]
        count = count + 1
         */
        
        /*
        nameLabel.text = friendsNames[0]
        bestFriendNameLabel.text = friendsNames[1]
        nextFriendNameLabel.text = friendsNames[2]
        */
        
        nameLabel.text = friend.myName
        bestFriendNameLabel.text = friend.bestFriendName
        nextFriendNameLabel.text = friend.nextFriendName
    }
    
}

