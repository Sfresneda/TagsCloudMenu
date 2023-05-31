//
//  ContentView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var headerItems: [HeaderItem] = HeaderItemBuilder.buildMock
    @State private var menuItems: [MenuItem] = MenuItemBuilder.buildMock

    var body: some View {
        VStack {
            HeaderView(items: $headerItems,
                       tapAction: handleHeaderTap)
            ScrollView {
                MenuView(items: $menuItems,
                         alignment: .trailing,
                         tapAction: { id in handleMenuTap(id: id) },
                         isDebug: true)
            }
        }
    }
}
private extension ContentView {
    func handleMenuTap(id: AnyHashable) {
        debugPrint("Button pressed with id: \(id)")
    }
    func handleHeaderTap(id: AnyHashable) {
        menuItems = menuItems.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
