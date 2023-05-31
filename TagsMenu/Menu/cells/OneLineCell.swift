//
//  WithIconCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct OneLineCell<Model: MenuItemWrap>: MenuCell {
    var model: Model
    var tapAction: ((Model.ID) -> Void)?
    let aligment: MenuAlignment

    var isDebug: Bool = false
    private let debugBackgroundColor: Color = .orange

    var body: some View {
        HStack {
            if aligment == .trailing {
                Spacer()
            }
            
            BaseCell(model: model,
                     extraContent: Image(systemName: "star"),
                     tapAction: tapAction,
                     isDebug: isDebug,
                     debugBackgroundColor: debugBackgroundColor)
            .addBorder()

            if aligment == .leading {
                Spacer()
            }
        }
    }
}
