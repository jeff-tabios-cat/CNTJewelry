//
//  SearchViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/5/22.
//

import Foundation
import SwiftUI
import Combine

struct SearchResult: Identifiable {
    let id = UUID()
    let text: String
}

enum SearchState {
    case empty
    case noResults
    case hasResult
}

final class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var results: [SearchResult] = [SearchResult(text: "result 1"),
                                              SearchResult(text: "result 2"),
                                              SearchResult(text: "result 3")]
    @Published var searchState: SearchState = .empty
    private var cancellable: AnyCancellable?
    private var searchCancellable: AnyCancellable?
    
    private let service = SearchService()
    
    init() {
        setupBindings()
    }
}

extension SearchViewModel {
    func setupBindings() {
        cancellable = nil
        cancellable = $query.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] q in
                guard let self = self else { return }
                if q.isEmpty {
                    self.searchState = .empty
                } else {
                    self.search()
                }
        }
    }
    
    func search() {
        searchCancellable = nil
        searchCancellable = try! service.search(query: query)
            .receive(on: DispatchQueue.main)
            .sink { result in
            print(result) // TODO: HANDLE ERROR IN REAL LIFE
        } receiveValue: { [weak self] articles in
            guard let self = self else { return }
            
            let filteredArticles = articles.data.entries.filter {
                if let found = $0.article.first?.title.contains(self.query), found {
                    self.searchState = .hasResult
                    return true
                } else {
                    self.searchState = .noResults
                    return false
                }
            }
            
            self.results = filteredArticles.map {
                SearchResult(text: $0.article.first?.title ?? "Untitled")
            }
        }
    }
}
