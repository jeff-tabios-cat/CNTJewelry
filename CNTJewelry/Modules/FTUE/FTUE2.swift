//
//  FTUE2.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import SwiftUI

struct FTUE2: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                
                Text("EASILY ACCESS YOUR DAILY BRIEFING")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("Your brief is curated with the latests things you need to know today")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                ZStack {
                    Image("goldBorder")
                        .padding(.top, 80)
                    Image("ftue2Img")
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundColor(.white)
        }
    }
}

struct FTUE2_Previews: PreviewProvider {
    static var previews: some View {
        FTUE2()
    }
}
