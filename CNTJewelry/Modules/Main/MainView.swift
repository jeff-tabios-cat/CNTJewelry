//
//  MainView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/11/22.
//

import SwiftUI

struct MainView: View {
    @State private var showDetails = false
    @State var selectedIndex = 0
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            switch selectedIndex {
            case 0:
                Briefing()
                    .frame(maxWidth: .infinity)
                    .background(.white)
            case 1:
                Live()
                    .frame(maxWidth: .infinity)
                    .background(.white)
            case 2:
                Resources()
                    .frame(maxWidth: .infinity)
                    .background(.white)
            case 3:
                Text("Plus!")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            default:
                Text("None!")
            }
            VStack {
                Spacer()
                BottomMenu(selectedIndex: $selectedIndex)
            }
            
        }
        .animation(.easeIn(duration: 1), value: selectedIndex)
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
