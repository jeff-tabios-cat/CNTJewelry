//
//  FTUE1.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import SwiftUI

struct FTUE1: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center, spacing: 30) {
                Image("goldDottedLine")
                Image("ribbons")
                Text("HELLO, JEAN,\nWELCOME TO CNT!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("This is CNT's new Retail Publishing Platform where you can find the latest news and updates around the world at CNT.")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                Image("goldDottedLine")
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundColor(.white)
        }
    }
}

struct FTUE1_Previews: PreviewProvider {
    static var previews: some View {
        FTUE1()
    }
}
