//
//  Endpoints.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

enum StoreAPI: String {
    case article = "https://someDomain.com/article"
    case takeAwayCard = "https://someDomain.com/takeaway_card"
    case user = "https://someDomain.com/user"
    case boutiqueBrief = "https://someDomain.com/boutique_brief"
    case takeAway = "https://someDomain.com/takeaway"
    case articleHero = "https://someDomain.com/article_hero"
    case keyTalkingPoints = "https://someDomain.com/key_talking_points"
    case quote = "https://someDomain.com/quote"
    
    var endpoint: String {
        self.rawValue
    }
}
