//
//  RegularCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct RegularCell<Model: MenuItemWrap>: View {
    var model: Model
    var tapAction: ((Model.ID) -> Void)?

    var isDebug: Bool = false
    private let debugBackgroundColor: Color = .teal

    var body: some View {
        HStack {
            BaseCell(model: model,
                     extraContent: HStack {},
                     tapAction: tapAction,
                     isDebug: isDebug,
                     debugBackgroundColor: debugBackgroundColor)
            .addBorder()
        }
    }
}
