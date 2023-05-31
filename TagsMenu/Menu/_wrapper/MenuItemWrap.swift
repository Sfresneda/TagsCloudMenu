//
//  MenuItemWrap.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import Foundation

// MARK: - MenuItemWrap
protocol MenuItemWrap: Identifiable, Equatable where ID: Equatable, ID: Hashable {
    associatedtype ID
    var id: ID { get }
    var name: String { get }
    var type: MenuItemType { get }
}
