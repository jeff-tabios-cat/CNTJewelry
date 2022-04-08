//
//  SearchView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/5/22.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    TextField("Search CNT", text: $viewModel.query)
                        .onChange(of: viewModel.query) { newValue in
                            viewModel.search()
                        }
                    Image("icon-black-search")
                        .tint(.white)
                        .foregroundColor(.white)
                }
                .frame(width: 300)
                List(viewModel.results) { result in
                    SearchResultRow(searchResult: result)
                }
                Spacer()
            }
        }
        
    }
}

// A view that shows the data for one Restaurant.
struct SearchResultRow: View {
    var searchResult: SearchResult

    var body: some View {
        Text("\(searchResult.text)")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
