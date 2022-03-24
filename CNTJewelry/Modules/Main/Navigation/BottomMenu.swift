//
//  BottomMenu.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/23/22.
//

import SwiftUI

struct BottomMenu: View {
    @Binding var selectedIndex: Int
    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                selectedIndex = 0
            }, label: {
                MenuButton(openImage: Image("icon-black-star"),
                           closedImage: Image("icon-white-star"),
                           label: "A la lune",
                           isOpen: .constant(selectedIndex == 0))
            })
            .animation(.easeIn, value: selectedIndex)
            Button(action: {
                selectedIndex = 1
            }, label: {
                MenuButton(openImage: Image("icon-black-eye"),
                           closedImage: Image("icon-white-eye"),
                           label: "Live",
                           isOpen: .constant(selectedIndex == 1))
            })
            .animation(.easeIn, value: selectedIndex)
            Button(action: {
                selectedIndex = 2
            }, label: {
                MenuButton(openImage: Image("icon-black-resources"),
                           closedImage: Image("icon-white-resources"),
                           label: "Resources",
                           isOpen: .constant(selectedIndex == 2))
            })
            .animation(.easeIn, value: selectedIndex)
            Button(action: {
                selectedIndex = 3
            }, label: {
                Image("icon-white-add-takeaway")
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.indigo)
                )
            })
            .animation(.easeIn, value: selectedIndex)
        }
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu(selectedIndex: .constant(0))
        BottomMenu(selectedIndex: .constant(1))
        BottomMenu(selectedIndex: .constant(2))
    }
}
