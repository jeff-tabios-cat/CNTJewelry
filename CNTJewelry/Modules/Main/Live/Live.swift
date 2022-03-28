//
//  Live.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/24/22.
//

import SwiftUI

struct Live: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TopNav()
            Image("live")
        }
        .background(Color.white)
    }
}

struct Live_Previews: PreviewProvider {
    static var previews: some View {
        Live()
    }
}
