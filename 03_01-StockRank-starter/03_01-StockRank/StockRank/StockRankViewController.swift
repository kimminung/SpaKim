//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList : [StockModel] = StockModel.list

    @IBOutlet weak var collectionView: UICollectionView!
    
        //Data, Presentation, Layout
        //Data - 어떤 데이터? -> stockList
        //Presentation - 셀을 어떻게 표현?
        //Layout - 셀을 어떻게 배치할거야?
    
        //protocol - 수행해야되는 규칙..
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //셀을 어떻게 표현할거냐?
        collectionView.dataSource = self    //데이터에 대해서 누가 알려줄거냐. SRV 컨트롤러가 ctV 뷰에게 알려줄 예정
        collectionView.delegate = self       //셀에서 어떻게 배치될거냐는 레이아웃 등을 알려주는 녀석이 델리게이트
        
    }
}

extension StockRankViewController: UICollectionViewDataSource {
    
    // 하나의 섹션 안에 여러개의 아이템을 표현할거다..
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //컬렉션 뷰에 등록된 것 중에 재사용 가능한 셀을 가져오겠다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell
        //몇번째에 해당하는것에 가져와서 쓰려고 하냐 = StockRankCollectionViewCell
        //class StockRankCollectionViewCell: UICollectionViewCell { 이기 때문에  as? StockRankCollectionViewCell 타입캐스팅이 필요함.
                //guard let으로 설정. 타입캐스팅? 이 실패할 수 있어서 성공시 진행하고, 못하면 그냥 UI뷰컨셀을 출력한다고 만들어줌.
        else {
            return UICollectionViewCell()
        }
        let stock = stockList[indexPath.item]
        cell.configure(stock) //Cannot use optional chaining on non-optional value of type 'StockRankCollectionViewCell'
        return cell
        
//        return UICollectionViewCell()   //일단 오류 안나게
    }
    
}
//Layout - 셀을 어떻게 배치할거야?
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
