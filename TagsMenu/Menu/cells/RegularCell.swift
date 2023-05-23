//
//  RegularCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct RegularCell: View {
    var model: any MenuItemWrap
    var tapAction: ((UUID) -> Void)?

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
