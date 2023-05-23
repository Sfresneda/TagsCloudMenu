//
//  ContentView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [MenuItem] = MenuItemBuilder.buildMock

    var body: some View {
        ScrollView {
            MenuView(items: $items,
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

struct MenuView_Previews: PreviewProvider {
    struct Container: View {
        @State private var items: [MenuItem] = MenuItemBuilder.buildMock
        private let universesItems = {
            let heyUID = UUID()
            let otherUid = UUID()
            let holiUID = UUID()
            return [
                [
                    MenuItem(title: "Hey",
                             containsIcon: false,
                             isSpacer: false,
                             id: heyUID),
                    MenuItem(title: nil,
                             containsIcon: false,
                             isSpacer: true),
                    MenuItem(title: nil,
                             containsIcon: false,
                             isSpacer: true),
                    MenuItem(title: "Holi",
                             containsIcon: false,
                             isSpacer: false,
                             id: holiUID),
                    MenuItem(title: "Otro",
                             containsIcon: false,
                             isSpacer: false,
                             id: otherUid),
                ],
                [
                    MenuItem(title: "Holi",
                             containsIcon: false,
                             isSpacer: false,
                             id: holiUID),
                    MenuItem(title: nil,
                             containsIcon: false,
                             isSpacer: true),
                    MenuItem(title: nil,
                             containsIcon: false,
                             isSpacer: true),
                    MenuItem(title: "Hey",
                             containsIcon: false,
                             isSpacer: false,
                             id: heyUID),
                    MenuItem(title: nil,
                             containsIcon: false,
                             isSpacer: true),
                    MenuItem(title: "Otro",
                             containsIcon: false,
                             isSpacer: false,
                             id: otherUid),
                ]
            ]
        }()
        
        var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        withAnimation(.default, {
                            items = universesItems[0]
                        })
                    }, label: {
                        Text("Uno")
                    })
                    Button(action: {
                        withAnimation(.default, {
                            items = universesItems[1]
                        })
                    }, label: {
                        Text("Dos")
                    })
                    Button(action: {
                        withAnimation(.default, {
                            items.shuffle()
                        })
                    }, label: {
                        Text("Shuffle")
                    })
                }
                ScrollView {
                    MenuView(items: $items,
                             alignment: .trailing)
                }
            }
        }
    }
    
    static var previews: some View {
        Container()
    }
}
