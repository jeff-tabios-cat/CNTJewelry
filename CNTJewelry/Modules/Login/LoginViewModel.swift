//
//  LoginViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/7/22.
//

import Foundation
import LocalAuthentication

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var faceIdInvalid = false
    @Published var faceIdNotAvailable = false
    @Published var isMainViewActive = false
    @Published var isHealthViewActive = false
    
    func loginWithFaceID() {
        let context = LAContext()
        var error: NSError? = nil
        
        //If FaceID/TouchID capable
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "authorize with touch id"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        self.faceIdInvalid = true
                        return
                    }
                    self.isMainViewActive = true
                }
            }
        } else {
            faceIdNotAvailable = true
        }
    }
    
    func openHealthStatusView() {
        self.isHealthViewActive = true
    }
}
