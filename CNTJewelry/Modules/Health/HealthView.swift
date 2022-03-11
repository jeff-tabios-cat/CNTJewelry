//
//  HealthView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/11/22.
//

import SwiftUI

struct HealthView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Your Health")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
