//
//  FTUEView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import SwiftUI

struct FTUEView: View {
    
    @StateObject var viewModel = FTUEViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView {
                FTUE1()
                FTUE2()
                FTUE3()
                FTUE4().environmentObject(viewModel)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.proceedToMain()
                    }, label: {
                        Image("icon-white-close")
                    })
                    .padding(.trailing, 30)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            NavigationLink(destination: MainView(), isActive: $viewModel.isMainViewActive){}
        }
        .navigationBarHidden(true)
    }
}

struct FTUEView_Previews: PreviewProvider {
    static var previews: some View {
        FTUEView()
    }
}
