//
//  ViewController.swift
//  KimsTodoListMemoji
//
//  Created by 민웅킴 on 3/19/24.
//

import UIKit


class ViewController: UIViewController {
    
    
    var list: [Todo] = Todo.list
    
//    var data3 = Array(1...40) // [Int]
////    let data2 = [1...40]  //다른 결과 [ClosedRange<Int>]
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addButton.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
    } //IBAction과 같은 방식의 Code형태.
        // IBAction의 경우 showAlert(_:)을 불러온다
    
    @objc func showAlert(_ button: UIButton) {
        button.isSelected = !button.isSelected
        
        let alertController = UIAlertController(title: "메모 추가", message: "출력 확인", preferredStyle: .alert)
        let add = UIAlertAction(title: "메모를 추가합니다.", style: .default) {_ in
            
            self.list.append(Todo(todoID: 1, todoTitle: "1", isCompleted: true))
            print("메모 추가됨")

            self.tableView.reloadData()
            
//            self.tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
        }
//        let addTextField
        
        for action in [add] {
            alertController.addAction(action)
        }
        
        present(alertController, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let todo = list[indexPath.item]     //indexPath.row대신 data3의 데이터를 넣는 방안으로
        cell.configure(todo)
        print("cellForRowAt : \(Todo.self)")
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        print("Will Display Cell : \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Did End Display Cell : \(indexPath.row)")
    }
}
