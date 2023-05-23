//
//  MenuItemWrap.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import Foundation

// MARK: - MenuItemWrap
protocol MenuItemWrap: Identifiable, Equatable {
    var id: UUID { get }
    var name: String { get }
    var type: MenuItemType { get }
}
