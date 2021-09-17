//
//  Datamanager.swift
//  IQA Air
//
//  Created by Stefano Brandi on 20/07/21.
//

import UIKit
import MapKit
import Alamofire

class Datamanager {
    
    static let shared = Datamanager()
    
    let annotationGlobal = MKPointAnnotation()
    
    var getData : Main = Main()
    
    let headers: HTTPHeaders = ["x-rapidapi-key": "23610c28d8msh60990f2713e479fp13d09cjsn29d24b8c9107",
                                "x-rapidapi-host": "air-quality.p.rapidapi.com"]
     
    
    
    func getIQA(view: UIViewController?, lat: Double, lon: Double, completion: @escaping (Bool) -> ()) {
          
        AF.request("https://air-quality.p.rapidapi.com/current/airquality?lat=\(lat)&lon=\(lon)", method: .get, headers: headers)
            .responseJSON { (response) in
                  
                if response.data != nil{
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try? jsonDecoder.decode(Main.self, from: response.data!)
                    
                    self.getData = responseModel!
                     
                      
                    completion(true)
                    
                } else {
                    print("Errore")
                    completion(true)
                }
                
            }
        
    }
    
    
}
