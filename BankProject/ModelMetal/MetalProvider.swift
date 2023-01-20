//
//  MetalProvider.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import Moya
import Moya_ObjectMapper

final class MetalProvider {
    private let provider = MoyaProvider<BelarusbankMetalAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getMetal(success: (([MetalModel]) -> Void)?, failure: (() -> Void)?) {
        provider.request(.getAllBankMetal) { result in
            switch result {
                case .success(let responce):
                    guard let result = try? responce.mapArray(MetalModel.self) else {
                        failure?()
                        return
                    }
                    success?(result)
                case .failure(let _):
                    failure?()
            }
        }
    }
}

