//
//  ArticleHero.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

// MARK: - ArticleHero
struct ArticleHero: Codable {
    let articleHero: ArticleHeroClass

    enum CodingKeys: String, CodingKey {
        case articleHero = "article_hero"
    }
}

// MARK: - ArticleHeroClass
struct ArticleHeroClass: Codable {
    let eyebrow, title: String
    let featuredAsset: String
    let timestamp: String
    let author: Author
    let dek: String
    let keyTalkingPoints: KeyTalkingPoint

    enum CodingKeys: String, CodingKey {
        case eyebrow, title
        case featuredAsset = "featured_asset"
        case timestamp, author, dek
        case keyTalkingPoints = "key_talking_points"
    }
}
