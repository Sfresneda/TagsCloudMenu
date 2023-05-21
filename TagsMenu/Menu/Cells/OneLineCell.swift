//
//  WithIconCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct OneLineCell: MenuCell {
    var model: MenuItemWrap
    var pressAction: ((UUID) -> Void)?
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
                     pressAction: pressAction,
                     isDebug: isDebug,
                     debugBackgroundColor: debugBackgroundColor)
            .addBorder()

            if aligment == .leading {
                Spacer()
            }
        }
    }
}
