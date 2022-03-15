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
                Text("This is a SwiftUI table")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                List {
                    Text("This is a sample row")
                    Text("This is a sample row")
                    Text("This is a sample row")
                    Text("This is a sample row")
                    Text("This is a sample row")
                }
                .font(.system(size: 30))
                
                VStack(spacing: 0) {
                    Button("Press to show animation") {
                        withAnimation {
                            showDetails.toggle()
                        }
                    }

                    if showDetails {
                        // Moves in from the bottom
                        Text("Details go here.")
                            .transition(.move(edge: .bottom))

                        // Moves in from leading out, out to trailing edge.
                        Text("Details go here.")
                            .transition(.move(edge: .bottom))

                        // Starts small and grows to full size.
                        Text("Details go here.")
                            .transition(.move(edge: .bottom))
                    }
                        
                }
                .font(.system(size: 30))
                .foregroundColor(Color.white)
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
