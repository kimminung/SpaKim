//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 민웅킴 on 4/11/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSize(width: 50, height: 50)
//        UICollectionView.init(frame: .zero, collectionViewLayout: flowLayout)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        
        pageControl.numberOfPages = messages.count // +2
        
//        pageControl.currentPage = // 0 ~
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell" , for: indexPath) as? OnboardingCell else {
            
            return UICollectionViewCell()
        }
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       == return CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    
}

extension OnboardingViewController: UIScrollViewDelegate {
    //스크롤되고있는 상황 파악 // 스크롤 도중에..
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                        //Offset = 얼마나 움직이는지 표현
    //        print(scrollView.contentOffset)
    //        print(scrollView.contentOffset.x / self.collectionView.bounds.width)
    
                // x는 3장의 컬렉션 너비만큼 가지고 있고 넘길떄마다 1장너비로 계산하여
                // Offser을 보여줌
    //        print(Int(scrollView.contentOffset.x / self.collectionView.bounds.width))
//}
    
    //스크롤을 넘기다가 감속해서 멈추는 경우를 파악
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("멈춤")
        
        //멈추는 값이 정수로 표현 됨
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        
        //페이지스크롤러에 대입
        pageControl.currentPage = index
    }
    
}
