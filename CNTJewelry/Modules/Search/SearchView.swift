//
//  SearchView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/5/22.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}

struct SearchView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ZStack {
                        HStack {
                            Text("Search")
                                .font(AppFonts.articleTitle)
                                .foregroundColor(getBackgroundColor())
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        
                        HStack {
                            Spacer()
                            Triangle()
                                .fill(getBackgroundColor())
                                .frame(width: 30, height: 30)
                                .frame(alignment: .trailing)
                        }
                        .padding(.top, 25)
                        
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .background(getHeaderBackgroundColor())
                    
                    Image(getExitIcon())
                        .tint(.white)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                        .padding(.leading, 30)
                }
                .frame(maxWidth: .infinity)
                
                HStack {
                    TextField("Search CNT", text: $viewModel.query)
                        .autocapitalization(.none)
                        .foregroundColor(getForegroundColor())
                    
                    Image(getSeachIconColor())
                        .tint(.white)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 40)
                
                Rectangle()
                    .frame(height: 1.0, alignment: .bottom)
                    .foregroundColor(getForegroundColor())
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                ScrollView {
                    LazyVStack(spacing: 1) {
                        ForEach(viewModel.results) { result in
                            SearchResultRow(searchResult: result)
                        }
                    }
                }
            }
            Spacer()
        }
        .background(getBackgroundColor())
        .animation(.easeIn(duration: 0.1), value: viewModel.searchState)
        .navigationBarHidden(true)
    }
    
    func getForegroundColor() -> Color {
        if viewModel.searchState == .hasResult {
            return AppColor.woodsmoke!
        } else {
            return Color.white
        }
    }
    
    func getHeaderBackgroundColor() -> Color {
        if viewModel.searchState == .hasResult {
            return AppColor.woodsmoke!
        } else {
            return Color.white
        }
    }
    
    func getBackgroundColor() -> Color {
        if viewModel.searchState == .hasResult {
            return Color.white
        } else {
            return AppColor.woodsmoke!
        }
    }
    
    func getSeachIconColor() -> String {
        if viewModel.searchState == .hasResult {
            return "icon-black-close"
        } else {
            return "icon-white-search"
        }
    }
    
    func getExitIcon() -> String {
        if viewModel.searchState == .hasResult {
            return "icon-black-close"
        } else {
            return "icon-white-close"
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
