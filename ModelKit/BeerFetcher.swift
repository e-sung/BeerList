//
//  BeerFetcher.swift
//  ModelKit
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol BeerFetcher {
    func fetchBeers(page:Int) -> Observable<[Beer]>
}

public class SDBeerFetcher: BeerFetcher {
    let jsonDecoder = JSONDecoder()
    public init() {
    }
    public func fetchBeers(page: Int) -> Observable<[Beer]> {
        let queryItem = URLQueryItem(name: "page", value: "\(page)")
        let endPoint = EndPoint(path: "/beers", queryItems: [queryItem])
        guard let url = endPoint.url else {
            return Observable.error(ClientAPIError.invalidURL)
        }
        let urlRequest = URLRequest(url: url)
        return URLSession.shared.rx
            .response(request: urlRequest)
            .single()
            .map({ response, json -> [Beer] in
                do {
                    return try self.jsonDecoder.decode([Beer].self, from: json)
                }
            })
    }
}
