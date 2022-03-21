//
//  FTUE4.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import SwiftUI

struct FTUE4: View {
    @EnvironmentObject var viewModel: FTUEViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .center, spacing: 20) {
                
                Text("ACCESS HELPFUL RESOURCES ON THE GO")
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("Find and download articles, titles and resources")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                ZStack {
                    Image("goldBorder")
                        .padding(.top, 80)
                    Image("ftue4Img")
                }
                
                Button(action: {
                    viewModel.proceedToMain()
                }, label: {
                    Text("Get Started")
                        .padding()
                        .frame(width: 280)
                        .font(.system(size: 25))
                        .background(Color.red)
                })
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .foregroundColor(.white)
        }
    }
}

struct FTUE4_Previews: PreviewProvider {
    static var previews: some View {
        FTUE4()
    }
}
