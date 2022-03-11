//
//  MainView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("Welcome!")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
