//
//  MetalModel.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import ObjectMapper

class MetalModel: Mappable {
    var ZOL_10_out: String = ""
    var ZOL_20_out: String = ""
    var ZOL_50_out: String = ""
    var name: String = ""
    var filials_text: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        ZOL_10_out      <- map["ZOL_10_out"]
        ZOL_20_out      <- map["ZOL_20_out"]
        ZOL_50_out      <- map["ZOL_50_out"]
        name            <- map["name"]
        filials_text    <- map["filials_text"]
    }
}
