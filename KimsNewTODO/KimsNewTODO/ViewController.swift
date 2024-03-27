//
//  ViewController.swift
//  KimsNewTODO
//
//  Created by 민웅킴 on 3/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    
    /*
     그리고 앞서 registerButton handler 클로저 부분에 tasks 배열에 할일이 추가될 수 있도록 캡쳐목록을 정의해주었습니다. 클로저 선언부분에서 캡쳐목록을 정의해주는 이유는, 클래스처럼 클로저는 참조타입이기 때문에 클로저의 본문에서 self로  클래스의 인스턴스를 캡쳐할때 강한 순환참조가 발생할 수 있다고합니다. 강한 순환참조란, 두개의 객체가 상호 참조하는 경우 강한 순환참조가 만들어지는데, 이렇게 되면 순환참조와 연관된 객체들은 레퍼런스 카운트가 0에 도달하지 않게 되고, 결국 메모리 누수가 발생하게 됩니다. 그래서 이 강한 순환참조를 해결하는 방법은 클로저의 순환부에서 캡쳐목록을 정의함으로써 해결할 수 있습니다. 우리는 [weak  self]를 작성하므로써 캡쳐목록을 정의했다고 생각하면 된다. (이후 또 다룰 예정이라고 합니다 . 그때 자세히 설명하도록 하겠습니다 ㅠㅠ ) 클로저의 선언부에 weak나 unknown 키워드로 캡쳐목록을 정의하지 않고, 접근하게 되면 강한 순환참조가 발생하게 되어 메모리 누수가 발생할 수 있다는 점만 알아두자.
     
     다시 코드로 돌아가서,
     
     */
    var doneButton: UIBarButtonItem?
    var tasks = [Task]() {
        didSet { // 프로퍼티 옵저버, tasks 배열에 할일이 추가될 때마다 유저 디폴트에 할일이 저장됨
            self.saveTasks()
        }
    }// Task 배열 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks() // 유저디폴츠에 저장된 할일을 앱을 껏다 켜도 다시 불러와주는것
    }
    /*
     이렇게 viewDidLoad 함수에 dataSource와 delegate를 self로 채택해주었습니다. 이렇게 작성하고 나면, UITableViewDataSource를 채택하라는 경고가 뜨게 됩니다. 따라서 class 외부에 extension을 이용해서 datasource를 채택해보도록 하겠습니다.
     */
    
    
    @objc func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    
    @IBAction func tapeditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    // alert; 제목, 메세지, 하나이상의 버튼 및 입력을 수집하기 위한 텍스트 필드로 구성되어 있다.
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            //등록버튼을 눌럿을때 텍스트필드에 있는 값을 가져올 수 있다.
            // textFields는 배열인데, 우리는 하나만 넣어놧기 때문에 [0]로 접근했음.
            
            self?.tableView.reloadData() // add된 할일들을 테이블뷰에 새로새로 업로드해주는 것
        })
        
        /*
         앞에서 설명했듯이 Add 버튼을 누르면 alert창을 띄워 추가할 수 있도록 만들 예정입니다. 따라서  alert 상수를 선언해서 UIAlertController를 이용해서 alert이 표시되게 만들었습니다. title은 "할일 등록", message는 "할일을 입력해주세요", preferredStyle 에는 .alert을 설정해주었습니다.
         
         preferredStyle 에는 alert와 action시트 두가지가 존재하는데, 두가지의 차이는 다음과같습니다.
         */
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        /*
         그 다음 registerbutton이라는 상수를 선언한후, UIAlertAction 기능을 활용하여 alert에 버튼이 추가되게 만들어줬습니다. Title은 등록, style은 디폴트로, handler 파라미터에는 클로저를 정의했습니다. 사용자가 알럿 버튼을 눌렀을때, 실행해야하는 행동을 클로저안에 정의해주면 됩니다. 등록버튼을 누를때마다 할일을 추가해줘야하기 때문에 이 기능을 담은 클로저를 정의해주면 됩니다.
         
         그 이후 alert 창에는 cancle 버튼도 추가해주기 위해서 canclebutton 을 선언해주었고, style은 cancle, 행동해야할 파라미터를 정의하는 handler에는 nil로 정의해주었습니다.
         */
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 말을 입력해주세요." })
        self.present(alert, animated: true, completion: nil)
        
        /*
         그리고 alert.addAction 메서드를 통해 방금 만든 uibutton을 넣어주면됩니다. 또한 우리는 alert창에서 할일에 대한 입력을 받을 것이기 때문에, textField를 추가해주어야합니다. textField를 추가하는 방법은 간단합니다. 위 코드처럼 alert.addTextFields 메서드를 통해 간단하게 추가할 수 있습니다. configurationhandler 파라미터에는 클로저를 넣어주어야 하는데, 알럿을 표시하기 전에 텍스트필드를 구성하기 위한 클로저입니다. 이 클로저는 반환값이 없고, textField 객체에 해당하는 단일매개변수를 사용합니다. 한마디로 알럿에 사용하는 텍스트필드를 설정하는 클로저라고 생각하면됩니다. 그래서 우리는 , "할일을 입력해 주세요" 라고 placeholder로 표시되게 만들었습니다.
         */
        
        
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String:Any]] else { return }
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
    
}


/*
 DataSource / Delegate 란?
 TableView를 사용하기 위해서는 uiTableView datasource와 UITableView delegate 프로토콜을 채택하여 구현해줘야한다.

 DataSource
 데이터를 받아 뷰를 그러주는 역할이다. 총 섹션이 몇개인지, 섹션의 행은 몇개인지, 행에 어떤 정보를 표시할건지 정의할 수 있다.

 delegate
 테이블뷰의 동작과 외관을 담당한다. 뷰가 변경되는 사항을 델리게이트가 담당한다. 그러면 뷰가 델리게이트에 의존하여 뷰를 업데이트 해준다. 행의높이, 행을 선택하면 어떤 액션을 취할건지 정할 수 있다. 👉🏻 따라서 테이블뷰는 데이터소스와 델리게이트의 정의에 따라 테이블뷰를 사용자에게 어떻게 보여줄건지 정의한다.
 */
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 사용하지 않는 메모리를 낭비하지 않기 위해서 dequeueResusableCell을 이용해서 셀을 재사용 하는 것
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        // 셀 표시됐을 때 체크마크 표시되게 하는 코드
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
        /*
         cell.textLabel?.text = task.title 코드 부분에서 task에 입력된 title들을 cell에 담아주고, return cell을 통해 반환해주었습니다. 그러면 할일을 등록할 때마다 테이블뷰를 갱신하여 보여주어야하기 때문에 tapAddButton 함수로 다시 돌아가서, self?.tableView.reloadData() 메서드를 통해 테이블뷰에 있는 내용들을 reload 해줄 수 있도록 만들어줍니다.

         여기까지 완료하면, add 버튼을 누를 때마다, 테이블뷰에 데이터가 로드되는 것을 볼 수 있습니다. 하지만 여기까지만 완료한다면, 문제점이 있는데 앱을 종료하게 될 경우 데이터가 저장되지 않고 입력했던 할일들이 모두 삭제된다는 것인데, 이를 해결하기 위해서는 userdefaults를 이용해서 우리가 입력한 데이터들이 앱을 재실행하더라도 모두 살아있도록 따로 처리를 해주어야합니다.


         */
        
        
    // commit for row at 이라는 메서드 구현
    // 삭제버튼 눌렀을때, 삭제버튼이 눌린 셀이 어떤 셀인지 알려주는 메서드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row) // remove cell 알려주는 것.
        tableView.deleteRows(at: [indexPath], with: .automatic) //automatic에니메이션을 설정하게 되면, 삭제버튼을 눌러서 삭제도 가능하고, 우리가 평소에 사용하던 스와이프해서 삭제하는 기능도 사용 가능하다.
        if self.tasks.isEmpty { //모든셀이 삭제되면
            self.doneButtonTap() // done버튼 메서드를 호출해서 편집모드를 빠져나오게 구현.
        }
    }
        
    //할일의 순서를 바꿀 수 있는 기능 구현
    // move row at 메서드를 구현 : 행이 다른 위치로 변경되면, souceIndexPath 파라미터를 통해 어디에 있었는지 알려주고, destinationIndexPath 파라미터를 통해 어디로 이동했는지 알려준다.
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // talbe뷰 셀이 재정렬 되면, 할일을 저장하는 배열도 재정렬 되어야함.
        // 따라서 테이블뷰 셀이 재정렬된 순서대로, tasks 배열도 재정렬 해줘야해서 아래 처럼 구현
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
}

extension ViewController: UITableViewDelegate {
    // 메서드 정의 : 셀을 선택하였을 때 어떤 셀이 선택되었는지 알려주는 메서드 : didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tasks 배열 요소에 접근해서, done이 true이면 false가 되게 만들어주고, false면 true 가 되게 만들어줄 것.
        var task = self.tasks[indexPath.row]
        task.done = !task.done   // 반대가 되게해줌
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
