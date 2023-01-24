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
    var html_ru: String = ""
    var img: UIImage
    
    required init?(map: ObjectMapper.Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        name_ru <- map["name_ru"]
        html_ru <- map["html_ru"]
        img <- map["img"]
    }
    
}
