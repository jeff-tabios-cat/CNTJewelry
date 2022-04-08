//
//  SearchItemView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 4/8/22.
//

import SwiftUI

struct SearchItemView: View {
    let image: String
    let title: String
    let summary: String
    var body: some View {
        VStack {
            Image(image)
            Text(title)
                .font(Font.custom("BrilliantCutProB7-Medium", size: 24))
            Text(summary)
                .font(Font.custom("BrilliantCutProB7-Medium", size: 24))
        }
        .padding()
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(image: "someimage",
                       title: "This is a sample title",
                       summary: "This is a sample summary. This is a sample summary. This is a sample summary. ")
    }
}
