//
//  FTUEViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/21/22.
//

import Foundation

final class FTUEViewModel: ObservableObject {
    @Published var isMainViewActive = false
    
    func proceedToMain() {
        isMainViewActive = true
    }
}
