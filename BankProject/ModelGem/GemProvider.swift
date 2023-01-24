//
//  GemProvider.swift
//  BankProject
//
//  Created by Mac on 19/01/2023.
//

import Foundation
import Moya
import Moya_ObjectMapper

final class GemProvider {
    private let provider = MoyaProvider<BelarusbankAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getGem(success: (([GemModel]) -> Void)?, failure: (() -> Void)?) {
        provider.request(.getAllBankGem) { result in
            switch result {
                case .success(let responce):
                    guard let result = try? responce.mapArray(GemModel.self) else {
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
