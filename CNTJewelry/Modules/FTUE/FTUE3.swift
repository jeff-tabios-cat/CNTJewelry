//
//  FTUE3.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import SwiftUI

struct FTUE3: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                
                Text("CHEAT SHEET HELPS WITH YOUR SALES")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("You can find all the latest collections of stories")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                ZStack {
                    Image("goldBorder")
                        .padding(.top, 80)
                    Image("ftue3Img")
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundColor(.white)
        }
    }
}

struct FTUE3_Previews: PreviewProvider {
    static var previews: some View {
        FTUE3()
    }
}
