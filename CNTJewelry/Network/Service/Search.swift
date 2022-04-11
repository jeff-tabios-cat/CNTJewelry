//
//  Search.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/10/22.
//

import Foundation
import Combine

final class SearchService: APIService {
    func search(query: String) throws -> AnyPublisher<Articles, Error> {
        let cancellable: AnyPublisher<Articles, Error> = request(url: StoreAPI.article.rawValue)
        return cancellable
    }
}
