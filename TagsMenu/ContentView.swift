//
//  ContentView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct ContentView: View {
    private var items: [MenuItem] = MenuItemBuilder.buildMock

    var body: some View {
        ScrollView {
            MenuView(items: items,
                     alignment: .leading,
                     buttonTapAction: { id in handleTap(id: id) },
                     isDebug: true)
        }
    }
}
private extension ContentView {
    func handleTap(id: UUID) {
        debugPrint("Button pressed with id: \(id.uuidString)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
