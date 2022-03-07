//
//  LoginViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/7/22.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
