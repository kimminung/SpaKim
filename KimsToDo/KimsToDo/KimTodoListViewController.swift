//
//  KimTodoListViewController.swift
//  KimsToDo
//
//  Created by 민웅킴 on 3/30/24.
//

import UIKit

class KimTodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //최초 사용시 초기화 하려고 lazy를 씀
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter
    }() //실행된걸 클로저로 호출. 반환은 dateFormatter
    
    var data: [KimTodo] = [
        KimTodo(id: .init(), title: "A"),
        KimTodo(id: .init(), title: "B"),
        KimTodo(id: .init(), title: "C")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.isEditing = true
    
    }
    @IBAction func didTapAddbutton(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "할일 추가", message: nil, preferredStyle: .alert)
        
        alertVC.addTextField()
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: { _ in
            alertVC.dismiss(animated: true) // 꺼야됨
        })
        
        alertVC.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "추가", 
                                      style: .default,
                                      handler: { _ in
            print("추가하기")
            
            
            
            // 텍트스필드에 있는 내용을 가지고 투두를 생성
            guard let textField = alertVC.textFields?.first,
                  let todoTitle = textField.text
            else { return }
            //        KimTodo(id: UUID.init(), title: <#T##String#>, isCompleted: <#T##Bool#>)
            let newKimTodo = KimTodo(id: .init(), title: todoTitle)
            
            
            // 만든 투두를 data에 append
            self.data.append(newKimTodo)
            
            
            // 텍스트뷰야 data를 새롭게 업데이트했으니 다시 그려라. //테이블에게 메소드(메세지를 보낸다)
//            self.tableView.reloadData()
            
            
            //어디 인덱스 패스에 부드럽게 추가할거냐?
            //데이터 count -1이 인덱스자리와 일치하니까 그걸 쓴다.
            let indexpath = IndexPath(row: self.data.count - 1, section: 0)
            self.tableView.insertRows(at: [indexpath], with: .automatic)
            
            
            //        tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
            //        tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
        })
        
        
        alertVC.addAction(addAction)
        
        self.present(alertVC, animated: true)
    }
    
}

extension KimTodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
        //셀 구성하는 코드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        tableView.dequeueReusableCell(withIdentifier: "KimTableViewCell", for: i ndexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: KimTableViewCell.reuseIdentifier, for: indexPath) as? KimTableViewCell //UITableViewCell
        
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
//            tableView.reloadData()
                    //remove reloadeData 이런걸 API라고 함
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        //
//        else if editingStyle == .insert {
//            
//        }
    }
    //
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .insert
//    }
    
}

extension KimTodoListViewController: TodoTableViewCellDelegate {
    func didComplete(_ indexPath: IndexPath, _ isOn: Bool) {
        
        //todo의 완료상태를 바꿀거야.
        data[indexPath.row].isCompleted = isOn
        
        
        //날짜만 나오게 응용할 코드..더 생각해보기
//        data[indexPath.row].createdAt = Date()
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
        print(indexPath, isOn)
        
    }
}

extension KimTodoListViewController: UITableViewDelegate {
    
}
