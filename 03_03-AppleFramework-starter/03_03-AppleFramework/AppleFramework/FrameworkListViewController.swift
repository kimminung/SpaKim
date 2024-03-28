//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by 민웅킴 on 3/28/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "🐣 Apple Frameworks"
        
        
        //Estimate size 조절을 코드로 표현하자면       //코드로 해두면 다른 개발자가 보기 쉬움.
//        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowlayout.estimatedItemSize = .zero // none과 같은 zero
//        }
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }

}
extension FrameworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath)
                as? FrameworkCell else {
            return UICollectionViewCell()
        }
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
    
    
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
        // 3열일때 계산
        //하기 전에 컬렉션뷰의 사이즈 인스펙터에서 상단 Estimate Size를 None으로 설정
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        //스페이싱을 설정해줬으니 3개를 넣으면 2개의 스페이싱공간이 생기니 그 2개를 빼주고 나머지를
        //3으로 나눠 사용한다는 너비 계산.
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2 ) / 3
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
        */
        
        /*
        // 2열일때 계산
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2 ) / 2
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
        */
        
        // 4열일때 계산
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2 ) / 4
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    //아이템간의 스페이싱
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

            //아이템 클릭에 반응하기 위한 델리게이트, didSelectItemAt
extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print("\(framework.name)")
    }
}
