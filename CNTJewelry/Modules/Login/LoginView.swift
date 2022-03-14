//
//  LoginView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/7/22.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                ZStack(alignment: .center) {
                    HStack {
                        Image("logobg")
                            .frame(width: 309, height: 160)
                        Spacer()
                    }
                    .padding(.bottom, 80)
                    
                    ZStack(alignment: .trailing) {
                        Image("bpx")
                            .resizable()
                            .frame(width: 226, height: 247, alignment: .trailing)
                    }
                    .frame(width: UIScreen.main.bounds.width,
                           height: 238,
                           alignment: .trailing)
                    .padding(.top, 180)
                    
                    HStack {
                        Image("logo")
                            .frame(width: 166, height: 46, alignment: .leading)
                            .padding(.leading, 50)
                    }
                    .padding(.bottom, 80)
                    .frame(width: UIScreen.main.bounds.width,
                           height: 46,
                           alignment: .leading)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Welcome to Cartier Atlas")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Text("Login with FaceID")
                        .font(.caption)
                        .foregroundColor(Color.white)
                    
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                
                Spacer()
                
                Button(action: {
                    viewModel.loginWithFaceID()
                }, label: {
                    Text("Login with FaceID")
                        .font(.system(size: 25))
                        .padding()
                        .frame(width: 280)
                        .border(.white, width: 1)
                        .foregroundColor(Color.white)
                }).alert(isPresented: $viewModel.faceIdInvalid) {
                    Alert(title: Text("Failed to authenticate"),
                          message: Text("Please try again"),
                          dismissButton: .default(Text("Got it!")))
                }.alert(isPresented: $viewModel.faceIdNotAvailable) {
                    Alert(title: Text("Face ID not available"),
                          message: Text(""),
                          dismissButton: .default(Text("Got it!")))
                }
            
                Button(action: {
                    viewModel.openHealthStatusView()
                }, label: {
                    Text("Your Health Profile")
                        .padding()
                        .frame(width: 280)
                        .font(.system(size: 25))
                        .border(.white, width: 1)
                        .foregroundColor(Color.white)
                })
                
                Spacer()
            }
            
            NavigationLink(destination: MainView(), isActive: $viewModel.isMainViewActive){}
            NavigationLink(destination: HealthView(), isActive: $viewModel.isHealthViewActive){}
        } // ZStack
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
