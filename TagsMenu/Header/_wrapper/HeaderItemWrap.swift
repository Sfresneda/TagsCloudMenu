//
//  HeaderItemWrap.swift
//  TagsMenu
//
//  Created by likeadeveloper on 31/5/23.
//

import Foundation

protocol HeaderItemWrap: Identifiable, Equatable where ID: Equatable, ID: Hashable {
    associatedtype ID

    var id: ID { get }
    var name: String { get }
}
