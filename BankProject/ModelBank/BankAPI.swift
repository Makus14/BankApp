//
//  BankAPI.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import Foundation
import Moya

enum BelarusbankAPI {
    case getAllBank
    case getAllBankGem
    case getAllBankMetal
}

extension BelarusbankAPI: TargetType {
    var baseURL: URL {
        switch self {
            case .getAllBank:
                return URL(string: "https://belarusbank.by/api/atm?")!
            case .getAllBankGem:
                return URL(string: "https://belarusbank.by/api/getgems")!
            case .getAllBankMetal:
                return URL(string: "https://belarusbank.by/api/getinfodrall")!
        }
}
    
    var path: String {
        return ""
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method {
        switch self {
            case .getAllBank, .getAllBankGem, .getAllBankMetal:
            return .get
        }
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
            case .getAllBank:
                parameters["city"] = ""
                parameters["ATM_currency"] = "BYN,USD,EUR"
            case .getAllBankGem:
                return nil
            case .getAllBankMetal:
                return nil
        }
        
        return parameters
    }
    
    var enocding: ParameterEncoding {
        switch self {
            case .getAllBank, .getAllBankGem, .getAllBankMetal:
                return URLEncoding.queryString
        }
    }
    
    
}
