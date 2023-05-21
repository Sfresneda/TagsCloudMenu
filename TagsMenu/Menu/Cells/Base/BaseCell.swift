//
//  BaseCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct BaseCell<Content: View>: MenuCell {
    var model: MenuItemWrap
    var extraContent: Content
    var pressAction: ((UUID) -> Void)?

    var isDebug: Bool = false
    var debugBackgroundColor: Color = .green

    var body: some View {
        Button {
            pressAction?(model.id)
        } label: {
            HStack {
                Text(model.name)
                    .lineLimit(1)
                extraContent
            }
        }
        .background(isDebug
                    ? debugBackgroundColor
                    : .clear)
    }
}

extension MenuCell {
    func addBorder(with padding: Bool = true) -> some View {
        let padding: EdgeInsets = padding
        ? EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        : EdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)

        return body
            .padding(padding)
            .border(.gray, width: 2)
    }
}
