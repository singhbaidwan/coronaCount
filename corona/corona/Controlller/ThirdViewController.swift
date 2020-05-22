//
//  ThirdViewController.swift
//  corona
//
//  Created by Dalveer singh on 10/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
//    var thirdView:Result?
    @IBOutlet weak var NC: UILabel!
    
    @IBOutlet weak var TC: UILabel!
    
    @IBOutlet weak var ND: UILabel!
    
    @IBOutlet weak var TD: UILabel!
    
    @IBOutlet weak var NR: UILabel!
    
    @IBOutlet weak var TR: UILabel!
    var dataUpadter = CoronaDataLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataUpadter.deleagte=self
        dataUpadter.DataLoader()
            }
    
}
//MARK:- ADopting the protocol
extension ThirdViewController:LoadData{
    func didUpdateData(data: Result) {
        DispatchQueue.main.async {
            self.NC.text = "New Confirmed Cases : \(data.Global.NewConfirmed)"
            self.TC.text = "Total Confirmed Cases : \(data.Global.TotalConfirmed)"
            self.ND.text = "New Deaths : \(data.Global.NewDeaths)"
            self.TD.text = "Total Deaths : \(data.Global.TotalDeaths)"
            self.NR.text = "New Recovered Cases : \(data.Global.NewRecovered)"
            self.TR.text = "Total Recovered Cases : \(data.Global.TotalRecovered)"
        }
        }
    
    func didFailWithError(error: Error) {
        print("Error Occured whiler loading the third view\(error)")
    }
    
    
}
