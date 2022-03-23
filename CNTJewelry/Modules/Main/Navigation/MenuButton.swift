//
//  MenuButton.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/23/22.
//

import SwiftUI

struct MenuButton: View {
    var openImage: Image
    var closedImage: Image
    var label: String
    @Binding var isOpen: Bool
    var body: some View {
        ZStack {
            HStack {
                if isOpen {
                    openImage
                    Text(label)
                        .foregroundColor(Color.black)
                } else {
                    closedImage
                }
            }
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 50, style: .continuous).fill(isOpen ? Color.white : Color.black)
            )
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isOpen ? Color.black : Color.white, lineWidth: 1)
            )
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(openImage: Image("icon-black-eye"),
                   closedImage: Image("icon-white-eye"),
                   label: "A la lune",
                   isOpen: .constant(false))
        MenuButton(openImage: Image("icon-black-eye"),
                   closedImage: Image("icon-white-eye"),
                   label: "A la lune",
                   isOpen: .constant(true))
    }
}
