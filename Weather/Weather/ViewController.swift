//
//  ViewController.swift
//  Weather2
//
//  Created by Prog on 23/06/17.
//  Copyright © 2017 Cesar Franco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtCountryISOCode: UITextField!
    @IBOutlet weak var txtCityName: UITextField!
    @IBOutlet weak var lblCurrent: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    
    


    @IBAction func getWeather(_ sender: Any) {
        let cityName : String = txtCityName.text!
        let encCityName : String = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let countryISO : String = txtCountryISOCode.text!
        let key : String = "3fd78cce1fee37962235f39e4084b108"
        let host : String = "http://api.openweathermap.org"
        let service : String = "/data/2.5/weather"
        let path : String = "\(host)\(service)"
        let query : String = "q=\(encCityName),\(countryISO)&APPID=\(key)&units=metric&lang=es"
        
        print("\(path)?\(query)")
        
        txtCityName.resignFirstResponder()
        txtCountryISOCode.resignFirstResponder()
        
        if let url : URL = URL(string: "\(path)?\(query)") {
            URLSession.shared.dataTask(with: url) {(data, url, error) in
                do  {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let root : Root = try decoder.decode(Root.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.lblCurrent.text = "\(root.main.temp)"
                        self.lblMax.text = "\(root.main.tempMax)"
                        self.lblMin.text = "\(root.main.tempMin)"
                    }
                }catch {
                }
        }.resume()
    }
        txtCountryISOCode.text = ""
        txtCityName.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

