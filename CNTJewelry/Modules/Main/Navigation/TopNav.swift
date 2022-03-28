//
//  TopNav.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/28/22.
//

import SwiftUI

struct TopNav: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("CNT")
                        .font(.title)
                    Text("Jewelry")
                        .font(.caption)
                }
                
                Spacer()
                Image("icon-black-search")
                Image("icon-black-profile")
            }
            .frame(width: 300)
            Image("HorizontalDots")
        }
    }
}

struct TopNav_Previews: PreviewProvider {
    static var previews: some View {
        TopNav()
    }
}
