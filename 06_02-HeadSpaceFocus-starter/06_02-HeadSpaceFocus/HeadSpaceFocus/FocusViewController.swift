//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by 민웅킴 on 4/18/24.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    //curated 추천
    var curated: Bool = false   //전체적으로 보여주고있으므로 큐리에이트중이지 않은중
    
    
    var items: [Focus] = Focus.list
    
    typealias Item = Focus  //별칭을 Item으로도 쓰겠다
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshButton.layer.cornerRadius = 10
        
        // Presentation, Data, Layout
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {return nil}
            
                //예전 방식
//            let data = self.items[indexPath.item]
//            cell.configure(data)
            
            
            //cell의 컨피규어
            cell.configure(item)
            return cell
        })
        
        //Diffable: 디퍼런스한것이 가능..
        //"Diffable"은 "difference"에서 파생된 용어로, 주로 데이터를 비교하고 변화를 쉽게 파악할 수 있도록 하는 기능을 의미합니다. "Diffable"은 "차이가 있는" 또는 "비교 가능한"이라는 의미를 갖습니다.
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        updateButtonTitle()
        
    }
    //dry
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        //estimated: 견적, 평가, 판단
        //소프트웨어에서는 예상치 못한 작업의 시간이나 리소스 소모를 추정할 때 사용될 수 있습니다. 또는 알고리즘이나 모델링에서는 입력 데이터나 변수에 대한 예상치를 사용하여 결과를 추정할 수 있습니다.
        //.estimated(50)) 안에는 1을 넣어도.. 일단 컨텐츠의 크기에 따라 변하겠다고 추정치를 넣은것
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
                            //.absolute(000)) 앱솔루트를 넣으면 절대적인 값을 정해줘야된다
        
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()    //Bool의 속성으로 f -> t, t -> f되는 스위칭
        
        //추천 누르면 추천된 리스트로 보여줄건지, 아니면 원래 리스트 전체 표시
        self.items = curated ? Focus.recommendations : Focus.list
        
        //컬렉션뷰 업데이트
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        updateButtonTitle()
    }
    
}
