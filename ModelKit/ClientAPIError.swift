//
//  ClientAPIError.swift
//  ModelKit
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation

public enum ClientAPIError: Error {
    case invalidURL
    case invalidJSON
    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL!"
        case .invalidJSON:
            return "Couldn't parese json"
        }
    }
}
