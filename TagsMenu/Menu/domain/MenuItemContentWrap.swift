//
//  MenuItemContentWrap.swift
//  TagsMenu
//
//  Created by likeadeveloper on 30/5/23.
//

import Foundation

struct MenuItemContentWrap: MenuItemWrap {
    typealias ID = AnyHashable

    var id: ID
    var name: String
    var type: MenuItemType

    init<T: MenuItemWrap>(_ wrapped: T) {
        id = AnyHashable(wrapped.id)
        name = wrapped.name
        type = wrapped.type
    }
}
