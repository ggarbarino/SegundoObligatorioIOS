//
//  List.swift
//
//
//  Created by SP07 on 25/5/16.
//
//

import Foundation
import ObjectMapper

class List: Mappable{
    var temp: Float32?
    var listw: [ListWeather]?
    var date: NSDate?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        self.temp <- map["temp.day"]
        self.listw <- map["weather"]
        self.date <- (map ["dt"], DateTransform())
    }
   
}