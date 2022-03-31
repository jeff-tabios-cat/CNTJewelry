//
//  Briefings.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - Briefings
struct Briefings: Codable {
    let items: [BriefingItem]
}

// MARK: - Item
struct BriefingItem: Codable {
    let type: String
    let content: Content
}

// MARK: - Content
struct Content: Codable {
    let id, slug, type, eyebrow: String
    let title: String
    let featuredAsset: String
    let timestamp, dek: String
    let note: Note?

    enum CodingKeys: String, CodingKey {
        case id, slug, type, eyebrow, title
        case featuredAsset = "featured_asset"
        case timestamp, dek, note
    }
}
