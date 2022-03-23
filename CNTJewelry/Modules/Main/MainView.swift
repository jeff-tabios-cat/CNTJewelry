//
//  MainView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/11/22.
//

import SwiftUI

struct MainView: View {
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Welcome!")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                Spacer()
                BottomMenu()
                    .padding()
            }
            
        }
        .navigationBarHidden(false)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
