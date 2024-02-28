//
//  MyTableViewController.swift
//  MyPracticeUI
//
//  Created by 민웅킴 on 1/17/24.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let friendsNames: [String] = ["Henry", "Kim", "Jay", "Key"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.backgroundColor = .yellow
        
        myTableView.backgroundColor = .blue
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}
    
    extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friendsNames.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
            cell.textLabel?.text = friendsNames[indexPath.row]
            return cell
        }
        
        
        
}


