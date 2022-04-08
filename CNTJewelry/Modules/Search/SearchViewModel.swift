//
//  SearchViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/5/22.
//

import Foundation
import SwiftUI

struct SearchResult: Identifiable {
    let id = UUID()
    let text: String
}

final class SearchViewModel: ObservableObject {
    @Published var query: String = "This is a search string"
    @Published var results: [SearchResult] = [SearchResult(text: "result 1"),
                                              SearchResult(text: "result 2"),
                                              SearchResult(text: "result 3")]
    
    init() {
        setupBindings()
    }
}

extension SearchViewModel {
    func setupBindings() {
        
    }
    
    func search() {
        
    }
}
