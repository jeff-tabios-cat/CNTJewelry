//
//  TakeAway.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - TakeAway
struct TakeAway: Codable {
    let takeaway: Takeaway
}

// MARK: - Takeaway
struct Takeaway: Codable {
    let takeawayTypes, takeawayTopics: [TakeawayT]

    enum CodingKeys: String, CodingKey {
        case takeawayTypes = "takeaway_types"
        case takeawayTopics = "takeaway_topics"
    }
}

// MARK: - TakeawayT
struct TakeawayT: Codable {
    let title, slug, id: String
}
