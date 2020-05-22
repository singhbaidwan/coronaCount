//
//  FourthViewController.swift
//  corona
//
//  Created by Dalveer singh on 11/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var NC: UILabel!
    
    @IBOutlet weak var TC: UILabel!
    
    @IBOutlet weak var ND: UILabel!
    
    @IBOutlet weak var TD: UILabel!
    
    @IBOutlet weak var NR: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var TR: UILabel!
    var NCs = 0
    var TCs = 0
    var NDs = 0
    var TDs = 0
    var NRs = 0
    var TRs = 0
    var CNs = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        NC.text = "New Confirmed Cases : \(NCs)"
        TC.text = "Total Confirmed Cases : \(TCs)"
        ND.text = "New Deaths : \(NDs)"
        TD.text = "Total Deaths : \(TDs)"
        NR.text = "New Recovered Cases : \(NRs)"
        TR.text = "Total Recovered Cases : \(TRs)"
        countryName.text = "\(CNs)"
            }
    


}
