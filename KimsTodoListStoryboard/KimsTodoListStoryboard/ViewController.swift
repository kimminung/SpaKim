//
//  ViewController.swift
//  KimsTodoListStoryboard
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView_: UITableView!
    @IBAction func ExitButton(_ sender: Any) {
        
    }
    
    var todoID : Int = 1
    let todoTitle : String = ""
    let cellName: String = "customCell"
    var cellTitle: Array<String> = ["pencil.circle","doc.circle","bolt.circle"]
    var isCompleted : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView_.delegate = self
        tableView_.dataSource = self
        addButton.addTarget(self, action: #selector(showAlert(_: )), for: .touchUpInside)
    }
    
    
    @objc func showAlert(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        let alertController = UIAlertController(title: "text", message: "textfield", preferredStyle: .alert)
        let add = UIAlertAction(title: "text22", style: .default) {_ in
            self.cellTitle.append(" ")
            self.tableView_.reloadData()
        }
        
        for action in [add] {
            alertController.addAction(action)
        }
        
        present(alertController, animated: !isCompleted)
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView_.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CustomCell
        
        Cell.images.image = UIImage(systemName: cellTitle[indexPath.row])
        Cell.textLabels.text = cellTitle[indexPath.row]
        
        return Cell
    }
    

    
    


}

