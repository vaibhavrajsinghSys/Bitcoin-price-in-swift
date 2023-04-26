//
//  BItcoinDataModel.swift
//  BitcoinTicker
//
//  Created by Kanishk Choraria on 25/04/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

// MARK: - BitcoinDataModel
struct BitcoinDataModel: Codable {
    var ask, bid, last, high: Double
    var low, volume: Double
    var bitcoinDataModelOpen: Open
    var averages: Averages
    var changes: Changes
    var volumePercent: Double?
    var timestamp: Int
    var displayTimestamp, displaySymbol: String

    enum CodingKeys: String, CodingKey {
        case ask, bid, last, high, low, volume
        case bitcoinDataModelOpen = "open"
        case averages, changes
        case volumePercent = "volume_percent"
        case timestamp
        case displayTimestamp = "display_timestamp"
        case displaySymbol = "display_symbol"
    }
}

// MARK: - Averages
struct Averages: Codable {
    var day, week, month: Double
}

// MARK: - Open
struct Open: Codable {
    var hour, day, week, month: Double
    var month3, month6, year: Double

    enum CodingKeys: String, CodingKey {
        case hour, day, week, month
        case month3 = "month_3"
        case month6 = "month_6"
        case year
    }
}

// MARK: - Changes
struct Changes: Codable {
    var price, percent: Open
}
