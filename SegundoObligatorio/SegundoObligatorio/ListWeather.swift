//
//  List.swift
//
//
//  Created by SP07 on 25/5/16.
//
//

import Foundation
import ObjectMapper

class ListWeather: Mappable{

    var icon: String?
    var id: Int?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        
        self.icon <- map["icon"]
        self.id <- map ["id"]
    }
}