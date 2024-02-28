//
//  ViewController.swift
//  SoinsuBunhae
//
//  Created by 민웅킴 on 1/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnA: UIButton!
    @IBOutlet var txtA: UITextField!
    @IBOutlet var lblA: UILabel!
    @IBOutlet var lblB: UILabel!
    @IBOutlet var lblC: UILabel!
    
    var sosuArr = [Int]()
    var dicA: Dictionary = [Int:Int]()
    
    func isThisSosu(a:Int) -> Bool {
        var isSosu : Bool = true
        if a>2 {
            for i in 2...a-1 {
                if a%i == 0 {
                    isSosu = false
                }
            }
        }
        return isSosu
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnPressed() {
        
        dicA.removeAll()
        let val : Int = Int(txtA.text!)!
        var valB = val
        
        if val == 2 {
            sosuArr.append(2)
            self.title = "\(val)은 소수입니다."
            self.lblA.text = "소인수:2"
            self.lblB.text = "소인수분해 값 정리->2:1"
            self.lblC.text = "1부터 \(val)까지의 소수->2"
        } else if isThisSosu(a: val) && val>0 {
            sosuArr.append(val)
            self.title = "\(val)은 소수입니다."
            self.lblA.text = "소인수->\(val)"
            self.lblB.text = "소인수분해 값 정리\(val):1"
            self.lblC.text = "1부터 \(val)까지의 소수->\(val)"
        } else if val>2 && !isThisSosu(a: val) {
            //소수 뽑아내기 (여기부터)
            sosuArr.append(2)
            sosuArr.append(3)
            for sosu in 4...val {
                if isThisSosu(a: sosu) {
                    sosuArr.append(sosu)
                }
            }
            
            //소수 뽑아내기 (여기까지)
            self.title = "\(val)은 소수가 아닙니다."
            print(val)
            
            for sosu in sosuArr {
                if valB%sosu == 0 {
                    if self.dicA[sosu] == nil {
                        self.dicA[sosu] = 1
                    } else {
                        self.dicA[sosu] = self.dicA[sosu]!+1
                    }
                    valB = valB/sosu
                    if isThisSosu(a: valB) {
                        if self.dicA[valB] == nil {
                            self.dicA[valB] = 1
                        } else {
                            self.dicA[valB] = self.dicA[valB]!+1
                        }
                        break
                    }
                }
            }
            print("소인수: \(dicA.keys.sorted())")
            print("소인수분해 값 정리: \(dicA)")
            print("1부터 \(val)까지의 소수: \(sosuArr)")
            print("---------------------------------")
            self.lblA.text = "소인수:\(dicA.keys.sorted())"
            self.lblB.text = "소인수분해 값 정리:\(dicA)"
            self.lblC.text = "1부터 \(val)까지의 소수: \(sosuArr)"
        } else {
            print("\(val)말고 자연수를 입력하십시오.")
            self.title = "\(val)말고 자연수를 입력하십시오."
        }
    }


}

