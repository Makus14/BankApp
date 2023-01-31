//
//  FilialsProvider.swift
//  BankProject
//
//  Created by Mac on 30/01/2023.
//

import Foundation
import Moya
import Moya_ObjectMapper

final class FilialsProvider {
    private let provider = MoyaProvider<BelarusbankAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getFilials(success: (([FilialsModel]) -> Void)?, failure: (() -> Void)?) {
        provider.request(.getAllBankFilials) { result in
            switch result {
                case .success(let responce):
                    guard let result = try? responce.mapArray(FilialsModel.self) else {
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
