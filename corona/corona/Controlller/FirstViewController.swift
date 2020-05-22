//
//  ViewController.swift
//  corona
//
//  Created by Dalveer singh on 07/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,LoadData{
    var colours:[UIColor] = [.red,.blue,.brown,.cyan,.darkGray,.gray,.green,.lightGray,.magenta,.orange,.purple,.systemIndigo,.systemPink,.systemTeal]
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    var result:Result?
    var NCs = 0
    var TCs = 0
    var NDs = 0
    var TDs = 0
    var NRs = 0
    var TRs = 0
    var nameOfCountry = ""
    func didUpdateData(data: Result) {
        print(data.Global.NewConfirmed)
        print(data.Countries[0].Country)
    result=data
        DispatchQueue.main.async {
            
        
            self.tableView.reloadData()
    }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
var dataLift = CoronaDataLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource=self
        tableView.delegate=self
        dataLift.deleagte=self
        dataLift.DataLoader()
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let typedName = textField.text{
            for names in result!.Countries
            {
                if typedName == names.Country{
                    textField.endEditing(true)
                performSegue(withIdentifier: K.segueName, sender: self)
                return
                }
            }
        }
        else{
            textField.text = "Type Something"
            textField.endEditing(true)
        }
    }
}
extension FirstViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (result?.Countries.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCellTableViewCell
        if let name = (result?.Countries[indexPath.row].Country){        cell.countryName.text = "  \(name)"
        }
        if let confirmedCases = result?.Countries[indexPath.row].NewConfirmed{
        cell.confiremedCases.text = "\(confirmedCases)"
//            cell.backgroundColor = colours.randomElement()
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NCs = result!.Countries[indexPath.row].NewConfirmed
        TCs = result!.Countries[indexPath.row].TotalConfirmed
        NDs = result!.Countries[indexPath.row].NewDeaths
        TDs = result!.Countries[indexPath.row].TotalDeaths
        NRs = result!.Countries[indexPath.row].NewRecovered
        TRs = result!.Countries[indexPath.row].TotalRecovered
        nameOfCountry = result!.Countries[indexPath.row].Country
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: K.segueName, sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segueName {
            let destinationVC = segue.destination as! FourthViewController
            destinationVC.NCs = NCs
            destinationVC.TCs = TCs
            destinationVC.NDs = NDs
            destinationVC.TDs = TDs
            destinationVC.NRs = NRs
            destinationVC.TRs = TRs
            destinationVC.CNs = nameOfCountry
        }
    }
}
