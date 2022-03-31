//
//  APIService.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(url: String, params: [String: Any]) -> AnyPublisher<T, Error>
}

extension APIService {
    func request<T: Decodable>(url: String, params: [String: Any]) -> AnyPublisher<T, Error> {
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let cancellable = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                //TODO: Stuff goess here of course
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return cancellable
    }
}
