//
//  Weather.swift
//  SegundoObligatorio
//
//  Created by SP07 on 20/5/16.
//  Copyright © 2016 Universidad Catolica. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    
    var city: String?
    var list: [List]?
    
    
    
    required init?(_ map: Map) {
        
    }

    func mapping(map: Map) {
        
        self.city <- map["city.name"]
        self.list <- map["list"]
        
    }
    
}
