//
//  BottomMenuViewModel.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/23/22.
//

import Foundation

final class BottomMenuViewModel: ObservableObject {
    @Published var starIsOpen = false
    @Published var eyeIsOpen = false
    @Published var bookIsOpen = false
    
    func openStar() {
        starIsOpen = true
        eyeIsOpen = false
        bookIsOpen = false
    }
    func openEye() {
        starIsOpen = false
        eyeIsOpen = true
        bookIsOpen = false
    }
    func openBook() {
        starIsOpen = false
        eyeIsOpen = false
        bookIsOpen = true
    }
}
