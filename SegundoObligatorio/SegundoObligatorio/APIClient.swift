//
//  APIClient.swift
//  SegundoObligatorio
//
//  Created by SP07 on 19/5/16.
//  Copyright © 2016 Universidad Catolica. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import SwiftLocation
import CoreLocation

class APIClient {
    var selectedUnit: Int? = 1
    var latitude: String = ""
    var longitude: String = ""
    var unit: String = ""
    static let sharedClient = APIClient()
    let prefs = NSUserDefaults.standardUserDefaults()
    
    
    private let baseURL = "http://api.openweathermap.org/data/2.5/forecast/"
    
    private init() {
        
    }
    func obtainCoordinates(onCompletion: () -> Void){
        
        try! SwiftLocation.shared.currentLocation(Accuracy.House, timeout: 20, onSuccess: { (location) -> Void in
            
            self.latitude = (location?.coordinate.latitude.description)!
            self.longitude = (location?.coordinate.longitude.description)!
            
                onCompletion()
            
            }) { (error) -> Void in
                // something went wrong
        }
        
    }
    
    func weatherOnCompletion(onCompletion: (weather: Weather?,error: NSError?) -> Void) {
        print(self.prefs.integerForKey("selectedUnit"))
        if self.prefs.integerForKey("selectedUnit")==0 {
                unit = "metric"
            }else{
                unit = "imperial"
            
        }
        
    
        Alamofire.request(.GET, self.baseURL+"daily?lat="+latitude+"&lon="+longitude+"&cnt=7&mode=json&units="+unit+"&appid=896b9e63623daffd1832f00bee22ca87").validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            
            switch response.result {
                
            case .Failure(let error):
                onCompletion(weather: nil, error: error)
            case .Success(let value):
                
                if let weather = Mapper<Weather>().map(value) {
                    
                    onCompletion(weather: weather, error: nil)
                }else {
                    onCompletion(weather: nil, error: NSError(domain: "MyApp", code: 9999, userInfo: [NSLocalizedDescriptionKey: "Fallo el mapeo"]))
                }
            }
            
        }
    }
}