//
//  NewsModel.swift
//  BankProject
//
//  Created by Mac on 24/01/2023.
//

import Foundation
import ObjectMapper

class NewsModel: Mappable {
    var name_ru: String = ""
    var link: String = ""
    var img: String = ""
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name_ru     <- map["name_ru"]
        link     <- map["link"]
        img         <- map["img"]
    }
    
}

