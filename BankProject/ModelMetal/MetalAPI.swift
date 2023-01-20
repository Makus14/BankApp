//
//  MetalAPI.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import Moya

enum BelarusbankMetalAPI {
    case getAllBankMetal
}

extension BelarusbankMetalAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://belarusbank.by/api/getinfodrall")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        switch self {
            case .getAllBankMetal:
                return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        return .requestParameters(parameters: parameters, encoding: enocding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var parameters = [String : Any]()
        
        switch self {
            case .getAllBankMetal:
                parameters["city"] = nil
        }
        
        return nil
    }
    
    var enocding: ParameterEncoding {
        switch self {
            case .getAllBankMetal:
                return URLEncoding.queryString
        }
    }
    
    
}
