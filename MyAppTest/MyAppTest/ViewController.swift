//
//  ViewController.swift
//  MyAppTest
//
//  Created by 민웅킴 on 3/18/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let pickerView = UIPickerView()
    let datas = ["Kim1","Min2","U3ng"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///UILabel
        //        setUILable()
        ///UIImageVIew
        //                setUIImageView()
        ///UITextField
        //                setUITextField()
        ///UIButton
        //                setUIButton()
        ///UISwitch
        //        setUISwitch()
        ///UISlider
        //        setUISlider()
        ///UISegmentedControl
        //        setUISegmentedControl()
        ///UIScrollView
        //        setUIScrollView()
        
        //        setUIPickerView()
        
        //        setUITableView()
        
        //        setUICollectionView()
        
    }
    
    
    
    func setUILable() {
        let label = UILabel()
        label.text = "안녕함. Kim 입니다"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.green
        label.textAlignment = .right
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        //        label.lineBreakMode = .byClipping
        //        label.lineBreakMode = .byTruncatingHead
        //        label.lineBreakMode = .byCharWrapping
        
        label.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(label)
    }
    
    
    func setUIImageView() {
        let imageView = UIImageView()
        let image = UIImage(named: "Image")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        //        imageView.contentMode = .scaleAspectFill
        
        imageView.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(imageView)
    }
    
    func setUITextField() {
        let textField = UITextField()
        textField.placeholder = "텍스트 입력 직전"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        //        textField.isSecureTextEntry = false
        textField.returnKeyType = .done
        
        textField.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        self.view.addSubview(textField)
    }
    
    func setUIButton() {
        let button = UIButton(type: .system)
        button.setTitle("버튼 눌러보십쇼 ㅋ", for: .normal)
        button.backgroundColor = UIColor.purple
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
        self.view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        print("버튼 눌림")
    }
    
    func setUISwitch() {
        let mySwitch = UISwitch()
        
        mySwitch.isOn = true
        mySwitch.onTintColor = UIColor.orange
        mySwitch.thumbTintColor = UIColor.brown
        mySwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        mySwitch.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(mySwitch)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    
    func setUISlider() {
        let slider = UISlider()
        
        slider.value = 50
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = UIColor.systemPink
        slider.maximumTrackTintColor = UIColor.systemBlue
        slider.thumbTintColor = UIColor.black
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        slider.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        self.view.addSubview(slider)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        print("Slider value: \(sender.value)")
    }
    
    func setUISegmentedControl() {
        let segmentedControl = UISegmentedControl(items: self.datas)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.isMomentary = false
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        segmentedControl.frame = CGRect(x: 50, y: 200, width: 300, height: 100)
        self.view.addSubview(segmentedControl)
        
    }
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        print("Selected segment index: \(sender.selectedSegmentIndex)")
    }
    
    func setUIScrollView() {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.bounces = true
        
        let label = UILabel(frame: CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 100))
        label.text = "Hello i'm label"
        label.textAlignment = .left
        scrollView.addSubview(label)
        
        self.view.addSubview(scrollView)
    }
    
    
    
    func setUIPickerView() {
        let pickerVIew = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.center = self.view.center
        
        
        self.view.addSubview(pickerView)
    }
    
    
    // UISegmentedControll & UIPickerView & UITableView & UICollectionView 사용
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datas.count    //몇 행을 지정할지 데이터 갯수 지정
    }
    
    //필수아님
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        datas[row]       //위임
    }
    //필수아님
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected: \(datas[row])")
    }
    
    func setUITableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = self.view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //        tableView.center = self.view.center
        
        self.view.addSubview(tableView)
    }
    
    
    //tabel필수 두개 DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count //섹션 식별자
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell // 셀을 dequeueReusableCell 재사용 가능하게 만들어 준다.
    }
    
    
    //필수아님  //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected: \(datas[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true) //이 부분 없으면 눌린 상태로 유지되는게 보통
    }
    
    
    func setUICollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = self.view.bounds
        collectionView.backgroundColor = .cyan
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        self.view.addSubview(collectionView)
    }
    
    //UICollectionViewDataSource
    //유연한 그리드 레이아웃을 사용하여 아이템 목록을 표시하고 사용자와 상호 작용할 수 있는 스크롤 가능한 UI 요소.
    //사진첩 등..
    
    //행 수       //필수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    
    //각 행에 대한 셀을 제공 //필수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    
    //UICollectionViewDelegate
    
    //행이 선택되었을 때 호출
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(datas[indexPath.row])")
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //UICollectionViewDelegateFlowLayout
    
    //셀의 크기를 보고
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
