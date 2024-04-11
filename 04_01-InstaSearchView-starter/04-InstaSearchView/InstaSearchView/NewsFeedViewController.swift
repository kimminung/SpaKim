//
//  NewsFeedViewController.swift
//  InstaSearchView
//
//  Created by 민웅킴 on 4/11/24.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            //내가 사이즈를 알아서 하기 때문에 시스템에서 알아서 추정 하지 말아라.
            //스토리보드에서 컬렉션뷰의 size inspector에 Estimate Size = None 설정하는 것 코드로.
            flowlayout.estimatedItemSize = .zero
        }
    }

}

extension NewsFeedViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            return UICollectionViewCell()
        }
        
//        cell.configure()
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        
        return cell
    }
    
    
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 4:3 -> 너비 : 높이
        
        let width = collectionView.bounds.width
        let heigh = width * 3/4 + 60
        return CGSize(width: width, height: heigh)
    }
}
