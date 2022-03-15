//
//  HealthView.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/11/22.
//

import SwiftUI

struct HealthView: View {
    
    @StateObject var viewModel = HealthViewModel()
    
    @ViewBuilder
    var profile: some View {
        
        HStack {
            Text("Age")
            Spacer()
            Text(viewModel.age)
        }
        HStack {
            Text("Sex")
            Spacer()
            Text(viewModel.sex)
        }
        HStack {
            Text("Blood Type")
            Spacer()
            Text(viewModel.bloodType)
        }
        HStack {
            Text("Weight")
            Spacer()
            Text(viewModel.weight)
        }
        HStack {
            Text("Height")
            Spacer()
            Text(viewModel.height)
        }
        HStack {
            Text("Body Mass Index (BMI)")
            Spacer()
            Text(viewModel.bmi)
        }
        
        
        Button(action: {
            viewModel.updateHealthInfo()
        }, label: {
            Text("Calculate BMI")
                .padding()
                .frame(width: 280)
                .font(.system(size: 25))
                .border(Color("lightDarkFont"), width: 1)
                .foregroundColor(Color("lightDarkFont"))
        }).alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Health Kit Error"),
                  message: Text("Cannot get health details"),
                  dismissButton: .default(Text("Got it!")))
        }
    }
    
    var body: some View {
        ZStack {
            Color("bgLightDark").ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Your Health Profile")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("lightDarkFont"))
                
                profile
                    .font(.title)
                    .foregroundColor(Color("lightDarkFont"))
                    .padding()
                
                Spacer()
                
                Button(action: {
                    viewModel.authorizeHealthKit()
                }, label: {
                    Text("Authorize")
                        .padding()
                        .frame(width: 280)
                        .font(.system(size: 25))
                        .border(Color("lightDarkFont"), width: 1)
                        .foregroundColor(Color("lightDarkFont"))
                }).alert(isPresented: $viewModel.showHealthKitAuthorized) {
                    Alert(title: Text("Health Kit Authorized"),
                          message: Text(""),
                          dismissButton: .default(Text("Got it!")))
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
        HealthView()
            .preferredColorScheme(.dark)
    }
}
