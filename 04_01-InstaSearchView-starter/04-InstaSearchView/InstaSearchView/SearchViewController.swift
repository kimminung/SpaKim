//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by 민웅킴 on 4/11/24.
//

import UIKit

class SearchViewController: UIViewController {
    
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
        
        //서치 뷰에 네비게이션을 만들고, 서치 만들어줌.
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"   //기본으로 보여줄 홀더
        searchController.searchResultsUpdater = self // 서치 data를 받아줄
//        Cannot assign value of type 'SearchViewController' to type '(any UISearchResultsUpdating)?'
        //준수해야될 UI
        self.navigationItem.searchController = searchController //네비의 서치컨트롤러는 위에 작성한 상수로 변경하겠다.
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    //아이템이 몇개 필요한거야
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    //셀을 어떻게 표현할거야
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    //sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1   //아이템간의 간격
        //셀의 너비는 전체의 너비에서 스페이싱2개 빼고 3등분
        let width = (collectionView.bounds.width - interItemSpacing * 2 )/3
        let height = width  //정사각형
        return CGSize(width: width, height: height)
    }
    //스토리보드의 size 인스펙터에서 Min Spacing에 10으로 보이는 중. 1로 계산
    //InteritemSpacing은 좌,우 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //LineitemSpacing은 위,아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

//Update 준수사항
extension SearchViewController: UISearchResultsUpdating {
    
    //필수
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search)")
    }
    

}
