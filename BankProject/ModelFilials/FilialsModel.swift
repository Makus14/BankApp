//
//  FilialsModel.swift
//  BankProject
//
//  Created by Mac on 30/01/2023.
//

import Foundation
import ObjectMapper

class FilialsModel: Mappable {
    var GPS_X: String = ""
    var GPS_Y: String = ""
    var name: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        GPS_X       <- map["GPS_X"]
        GPS_Y       <- map["GPS_Y"]
        name        <- map["name"]
        
    }
    
}
