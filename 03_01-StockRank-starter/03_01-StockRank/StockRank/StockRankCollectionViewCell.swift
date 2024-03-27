//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    //UIComponent 연결하자
    //UIComponent에 데이터를 업데이트하는 코드를 넣자
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
//        companyPriceLabel.text = "\(stock.price) 원"
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
//        let color: UIColor
//        if stock.diff > 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
//        
//        diffLabel.textColor = color
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff)%"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""     //끝에 !으로 강제 언래핑보다는 result?가 낫지만 안정적으로 ??이면 ""을 출력하라는 방식
        return result
    }
    
}
