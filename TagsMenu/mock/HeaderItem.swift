//
//  HeaderItem.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import Foundation

struct HeaderItem {
    var id: UUID = UUID()
    var title: String
}
extension HeaderItem: Identifiable, Equatable {}
extension HeaderItem: HeaderItemWrap {
    var name: String {
        title
    }
}
struct HeaderItemBuilder {
    static var buildMock: [HeaderItem] = {
        Range(0...Int.random(in: Range(3...6))).map { index in
            HeaderItem(title: String(UUID().uuidString
                .prefix(Int.random(in: Range(3...20)))))
        }
    }()
}
