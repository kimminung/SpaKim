//
//  WeatherViewController.swift
//  simpleWeather
//
//  Created by 민웅킴 on 3/22/24.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let cities = ["Seoul","Tokyo","LA","Seattle",]
    let weathers = ["cloud.fill","sun.max.fill","wind","cloud.sun.rain.fill"]
    
    @IBAction func changeButton(_ sender: Any) {
        
        cityLabel.text = cities.randomElement()
        
        let imageName = weathers.randomElement()!
        
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        temperatureLabel.text = "\(randomTemp)°"
    }
    
  

}
