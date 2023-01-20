//
//  GemAPI.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import Moya

enum BelarusbankGemAPI {
    case getAllBankGem
}

extension BelarusbankGemAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://belarusbank.by/api/getgems")!
    }
    
    var path: String {
        return ""
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllBankGem:
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
            case .getAllBankGem:
                parameters["city"] = nil
        }
        
        return nil
    }
    
    var enocding: ParameterEncoding {
        switch self {
            case .getAllBankGem:
                return URLEncoding.queryString
        }
    }
    
    
}
