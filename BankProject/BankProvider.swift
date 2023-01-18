//
//  BankProvider.swift
//  BankProject
//
//  Created by Mac on 17/01/2023.
//

import Foundation
import Moya

typealias ArrayResponce<T: Decodable> = (([T]) -> Void)
typealias ObjectResponce<T: Decodable> = ((T) -> Void)
typealias Error = ((String) -> Void)

final class BelarusbankProvider {
    private let provider = MoyaProvider<BelarusbankAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getCurrency(success: @escaping ArrayResponce<Location>, failure: @escaping Error) {
        provider.request(.getAllBank) { result in
            switch result {
            case .success(let responce):
                guard let location = try? JSONDecoder().decode([Location].self, from: responce.data) else { return }
                success(location)
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}

