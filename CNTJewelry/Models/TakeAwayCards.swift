//
//  TakeAwayCards.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - TakeAwayCards
struct TakeAwayCards: Codable {
    let data: DataClass
}

// MARK: - TakeawayItem
struct TakeawayItem: Codable {
    let takeawayTitle, timestamp: String
    let type: [Eyebrow]
    let image: [JSONAny]
    let content: String
    let primaryTopic, subTopic: [Eyebrow]

    enum CodingKeys: String, CodingKey {
        case takeawayTitle = "takeaway_title"
        case timestamp, type, image, content
        case primaryTopic = "primary_topic"
        case subTopic = "sub_topic"
    }
}

// MARK: - Video
struct Video: Codable {
    let title, duration: String
    let thumbnail: [FeaturedAsset]
    let url: [URLElement]
    let caption, credit: String
}
