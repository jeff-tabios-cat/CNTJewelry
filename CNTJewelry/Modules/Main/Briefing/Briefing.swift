//
//  Briefing.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/24/22.
//

import SwiftUI

struct Briefing: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            TopNav()
            Image("briefing")
        }
        .background(Color.white)
    }
}

struct Briefing_Previews: PreviewProvider {
    static var previews: some View {
        Briefing()
    }
}
