//
//  LoginView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/7/22.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                ZStack(alignment: .top) {
                    ZStack(alignment: .leading) {
                        Image("logobg")
                            .frame(width: 359, height: 160, alignment: .leading)
                    }
                    
                    ZStack(alignment: .trailing) {
                        Image("bpx")
                            .resizable()
                            .frame(width: 226, height: 247, alignment: .trailing)
                    }
                    .frame(width: UIScreen.main.bounds.width,
                           height: 238,
                           alignment: .trailing)
                    .padding(.top, 80)
                    
                    
                    ZStack(alignment: .leading) {
                        Image("logo")
                            .frame(width: 166, height: 46, alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width,
                           height: 46,
                           alignment: .leading)
                    .padding(.leading, 100)
                    .padding(.top, 50)
                }
                
                VStack(alignment: .leading) {
                    Text("Welcome to Cartier Atlas")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Text("Please enter your login details below:")
                        .font(.caption)
                        .foregroundColor(Color.white)
                    
                    TextField("Email", text: $username)
                        .foregroundColor(Color.white)
                        .font(.body)
                        .frame(height: 40)
                    
                    TextField("Password", text: $username)
                        .foregroundColor(Color.white)
                        .font(.body)
                        .frame(height: 40)
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: 46,
                       alignment: .leading)
                .padding(.top, 32)
                .padding(.leading, 32)
                
                
            
                Button(action: {
                }, label: {
                    Text("Log In")
                        .frame(height: 56)
                        .frame(width: 250)
                        .border(.white, width: 1)
                        .foregroundColor(Color.white)
                        .padding(.top, 60)
                })
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
