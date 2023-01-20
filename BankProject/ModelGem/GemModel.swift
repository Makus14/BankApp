//
//  GemModel.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import ObjectMapper

class GemModel: Mappable {
    
    var attestat: String = ""
    var name_ru: String = ""
    var grani: String = ""
    var weight: String = ""
    var color: String = ""
    var cost: String = ""
    var name: String = ""
    var filials_text: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: ObjectMapper.Map) {
        attestat             <- map["attestat"]
        name_ru              <- map["name_ru"]
        grani                <- map["grani"]
        weight               <- map["weight"]
        color                <- map["color"]
        cost                 <- map["cost"]
        name                 <- map["name"]
        filials_text         <- map["filials_text"]
        
    }
    
    
}
