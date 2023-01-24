//
//  NewsProvider.swift
//  BankProject
//
//  Created by Mac on 24/01/2023.
//

import Foundation
import Moya
import Moya_ObjectMapper

final class NewsProvider {
    private let provider = MoyaProvider<BelarusbankAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getNews(success: (([NewsModel]) -> Void)?, failure: (() -> Void)?) {
        provider.request(.getAllBankNews) { result in
            switch result {
                case .success(let responce):
                    guard let result = try? responce.mapArray(NewsModel.self) else {
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
