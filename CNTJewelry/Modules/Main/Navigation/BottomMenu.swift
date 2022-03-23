//
//  BottomMenu.swift
//  CNTJewelry
//
//  Created by Jeffrey Tabios on 3/23/22.
//

import SwiftUI

struct BottomMenu: View {
    @StateObject var viewModel = BottomMenuViewModel()
    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                viewModel.openStar()
            }, label: {
                MenuButton(openImage: Image("icon-black-star"),
                           closedImage: Image("icon-white-star"),
                           label: "A la lune",
                           isOpen: $viewModel.starIsOpen)
            })
            Button(action: {
                viewModel.openEye()
            }, label: {
                MenuButton(openImage: Image("icon-black-eye"),
                           closedImage: Image("icon-white-eye"),
                           label: "Live",
                           isOpen: $viewModel.eyeIsOpen)
            })
            Button(action: {
                viewModel.openBook()
            }, label: {
                MenuButton(openImage: Image("icon-black-resources"),
                           closedImage: Image("icon-white-resources"),
                           label: "Resources",
                           isOpen: $viewModel.bookIsOpen)
            })
            Button(action: {
            }, label: {
                Image("icon-white-add-takeaway")
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.indigo)
                )
            })
        }
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu()
    }
}
