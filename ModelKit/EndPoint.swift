//
//  EndPoint.swift
//  ModelKit
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation


public struct EndPoint {
    public var path: String
    public var queryItems: [URLQueryItem] = []
    var domain = "api.punkapi.com"
    var apiVersion = "/v2"
    public var url:URL? {
        var urlComponent = URLComponents()
        urlComponent.host = domain
        urlComponent.path = apiVersion + path
        urlComponent.scheme = "https"
        if queryItems.count > 0 {
            urlComponent.queryItems = queryItems
        }
        return urlComponent.url
    }
}
