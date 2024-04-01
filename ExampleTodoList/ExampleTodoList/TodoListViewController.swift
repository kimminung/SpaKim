//
//  TodoListViewController.swift
//  ExampleTodoList
//
//  Created by woochan on 3/28/24.
//

import UIKit

class TodoListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yy년 MM월 dd일" // "24년 3월 28일"
    return dateFormatter
  }()
  
  var data: [Todo] = [Todo(id: .init(),
                           title: "A"),
                      Todo(id: .init(),
                           title: "B"),
                      Todo(id: .init(),
                           title: "C")
  ]
  
  override func viewDidLoad() {
      super.viewDidLoad()
    tableView.dataSource = self
  }
  
  @IBAction func didTapAddbutton(_ sender: Any) {
    
    let alertVC = UIAlertController(title: "할일 추가",
                      message: nil,
                      preferredStyle: .alert)
    
    alertVC.addTextField()
    
    let cancelAction = UIAlertAction(title: "취소",
                  style: .cancel,
                  handler: { _ in
      alertVC.dismiss(animated: true)
    })
    
    alertVC.addAction(cancelAction)
    
    let addAction = UIAlertAction(title: "추가",
                                  style: .default,
                                  handler: { _ in
      
      // 1. 텍스트필드에 있는 내용을 가지고 투두를 생성
      
      guard let textField = alertVC.textFields?.first,
            let todoTitle = textField.text
      else { return }
      
      let newTodo = Todo(id: .init(), title: todoTitle)
      
      // 2. 만든 투두를 data 에 append
      
      self.data.append(newTodo)
      
      // 3. 야, 테이블뷰야 data 새롭게 업데이트 됬으니까 이거 가지고 다시그려~!
      
      let indexpath = IndexPath(row: self.data.count - 1, section: 0)
      
      self.tableView.insertRows(at: [indexpath], with: .automatic)
    })
    
    alertVC.addAction(addAction)
    
    self.present(alertVC, animated: true)
  }
}

extension TodoListViewController: UITableViewDataSource {
  
  // 섹션별로 섹션안에 들어있는 row 의 개수를 (시스템이 우리한테) 묻는 메서드
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  
  // 셀 구성하는 코드
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.reuseIdentifier,
                                  for: indexPath) as? TodoTableViewCell
    let todo = data[indexPath.row]
    
    cell?.title.text = todo.title
    cell?.switch.isOn = todo.isCompleted
    cell?.strikeThroughView.isHidden = !todo.isCompleted
    
    cell?.delegate = self
    
    let dateString = self.dateFormatter.string(from: todo.createdAt)
    
    cell?.dateLabel.text = dateString
    
    cell?.indexPath = indexPath
    
    return cell ?? UITableViewCell()
    
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      data.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
}

extension TodoListViewController: TodoTableViewCellDelegate {
  
  func didComplete(_ indexPath: IndexPath, _ isOn: Bool) {
    
    data[indexPath.row].isCompleted = isOn
    
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
    
  }
}

