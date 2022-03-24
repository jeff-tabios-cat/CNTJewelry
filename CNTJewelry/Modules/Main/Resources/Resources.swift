//
//  Resources.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/24/22.
//

import SwiftUI

struct Resources: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image("resources")
        }
        .background(Color.white)
    }
}

struct Resources_Previews: PreviewProvider {
    static var previews: some View {
        Resources()
    }
}
