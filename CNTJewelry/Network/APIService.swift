//
//  APIService.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/31/22.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(url: String) -> AnyPublisher<T, Error>
}

extension APIService {
    func request<T: Decodable>(url: String) -> AnyPublisher<T, Error> {
        
        //MOCK!
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let sessionManager = URLSession(configuration: configuration)
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        let cancellable = sessionManager.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) -> Data in
                //TODO: Stuff goess here of course
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return cancellable
    }
}
