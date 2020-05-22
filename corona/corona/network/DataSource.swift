//
//  DataSource.swift
//  corona
//
//  Created by Dalveer singh on 08/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import Foundation

struct Result:Codable{
    var Global:GloabalData
    let Countries:[CountriesData]
}
struct GloabalData:Codable{
    let NewConfirmed:Int
    let TotalConfirmed:Int
    let NewDeaths:Int
    let TotalDeaths:Int
    let NewRecovered:Int
    let TotalRecovered:Int
}
struct CountriesData:Codable{
    let Country:String
    let CountryCode:String
    let Slug:String
    let NewConfirmed:Int
    let TotalConfirmed:Int
    let NewDeaths:Int
    let TotalDeaths:Int
    let NewRecovered:Int
    let TotalRecovered:Int
}
