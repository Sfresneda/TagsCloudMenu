//
//  SpacerCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct SpacerCell: MenuCell {
    var isDebug: Bool = false
    private let debugBackgroundColor: Color = .indigo

    var body: some View {
            Text(" ")
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .background(isDebug
                        ? debugBackgroundColor
                        : .clear
            )
    }
}

struct SpacerCell_Previews: PreviewProvider {
    static var previews: some View {
        SpacerCell()
    }
}
