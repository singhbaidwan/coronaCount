//
//  NetwrokDecoder.swift
//  corona
//
//  Created by Dalveer singh on 08/04/20.
//  Copyright © 2020 Dalveer singh. All rights reserved.
//

import Foundation
protocol LoadData {
    func didUpdateData(data:Result)
    func didFailWithError(error:Error)
}
struct CoronaDataLoader{
    var deleagte:LoadData?
    
    func DataLoader(){
        let url = URL(string: "https://api.covid19api.com/summary")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            if let safeData = data{
                if let decodedData = self.parseJSON(safeData)
                {
                    self.deleagte?.didUpdateData(data: decodedData)
                }
            }
        }
        task.resume()
    }
    func parseJSON(_ data:Data)->Result?{
        let decorder = JSONDecoder()
        do{
            let decodedData = try decorder.decode(Result.self, from: data)
            return decodedData
        }
        catch{
            print(error)
            return nil
        }
    }
}
