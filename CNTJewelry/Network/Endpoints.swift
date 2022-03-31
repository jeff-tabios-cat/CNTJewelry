//
//  Endpoints.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation

enum StoreAPI: String {
    case article = "http://someDomain.com/article"
    case takeAwayCard = "http://someDomain.com/takeaway_card"
    case user = "http://someDomain.com/user"
    case boutiqueBrief = "http://someDomain.com/boutique_brief"
    case takeAway = "http://someDomain.com/takeaway"
    case articleHero = "http://someDomain.com/article_hero"
    case keyTalkingPoints = "http://someDomain.com/key_talking_points"
    case quote = "http://someDomain.com/quote"
    
    var endpoint: String {
        self.rawValue
    }
}
