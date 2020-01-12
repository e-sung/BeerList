//
//  BeerModel.swift
//  ModelKit
//
//  Created by 류성두 on 2020/01/12.
//  Copyright © 2020 Sungdoo. All rights reserved.
//

import Foundation

/**
 맥주를 표현하는 Data모델
  https://api.punkapi.com/v2/beers/1 의 모습으로 내려오는 JSON과 대응됨
*/
public struct Beer: Codable {
    public let id: Int?
    public let name, tagline, firstBrewed, beerDescription: String?
    public let imageURL: String?
    public let abv: Double
    public let ibu, targetFg, targetOg, ebc: Double?
    public let srm: Double?
    public let ph: Double?
    public let attenuationLevel: Double?
    public let volume, boilVolume: BoilVolume
    public let method: Method
    public let ingredients: Ingredients
    public let foodPairing: [String]?
    public let brewersTips, contributedBy: String?

    public enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case beerDescription = "description"
        case imageURL = "image_url"
        case abv, ibu
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case ebc, srm, ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method, ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}

// MARK: - BoilVolume
public struct BoilVolume: Codable {
    let value: Double?
    let unit: String?
}

// MARK: - Ingredients
public struct Ingredients: Codable {
    let malt: [Malt]?
    let hops: [Hop]?
    let yeast: String?
}

// MARK: - Hop
public struct Hop: Codable {
    let name: String?
    let amount: BoilVolume?
    let add, attribute: String?
}

// MARK: - Malt
public struct Malt: Codable {
    let name: String?
    let amount: BoilVolume?
}

// MARK: - Method
public struct Method: Codable {
    let mashTemp: [MashTemp]?
    let fermentation: Fermentation?
    let twist: String?

    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation, twist
    }
}

// MARK: - Fermentation
public struct Fermentation: Codable {
    let temp: BoilVolume?
}

// MARK: - MashTemp
public struct MashTemp: Codable {
    let temp: BoilVolume?
    let duration: Double?
}

