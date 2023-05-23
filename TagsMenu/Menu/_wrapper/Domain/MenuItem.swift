//
//  MenuItem.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import Foundation
import SwiftUI

// MARK: - MenuItemWrap
protocol MenuItemWrap {
    var id: UUID { get }
    var name: String { get }
    var type: MenuItemType { get }
}

struct MenuItem: Identifiable, Equatable {
    var id: UUID
    var title: String?
    var isOneLine: Bool
    var isSpacer: Bool

    init(title: String?,
         containsIcon: Bool,
         isSpacer: Bool,
         id: UUID = UUID()) {
        self.title = title
        self.isOneLine = containsIcon
        self.isSpacer = isSpacer
        self.id = id
    }
    
    static func ==(rhs: MenuItem, lhs: MenuItem) -> Bool {
        rhs.id == lhs.id
    }
}

extension MenuItem: MenuItemWrap {
    var name: String {
        title ?? "-"
    }
    var type: MenuItemType {
        if isOneLine {
            return .oneLine
        }
        if isSpacer {
            return .spacer
        }
        return .regular
    }
}

struct MenuItemBuilder {
    static var buildMock: [MenuItem] = {
        Range(0...Int.random(in: Range(10...50))).map { index in
            MenuItem(title: String(UUID().uuidString
                .prefix(Int.random(in: Range(3...20)))),
                     containsIcon: index.isMultiple(of: 16),
                     isSpacer: index.isMultiple(of: 12))
        }
    }()
}
