//
//  MenuView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var items: [MenuItem]
    var alignment: MenuAlignment
    var buttonTapAction: ((UUID) -> Void)?
    
    var isDebug: Bool = false

    var body: some View {
        WrappedZStackView(models: $items,
                          horizontalSpacing: 5,
                          verticalSpacing: 2,
                          alignment: alignment) { item in
            buildCellforItem(item)
        }
    }
}
private extension MenuView {
    func buildCellforItem(_ item: MenuItemWrap, priority: Double = .zero) -> some View {
        switch item.type {
        case .regular:
            return AnyView(
                RegularCell(model: item,
                            pressAction: buttonTapAction,
                            isDebug: isDebug)
            )

        case .spacer:
            return AnyView(
                SpacerCell(isDebug: isDebug)
            )

        case .oneLine:
            return AnyView(
                OneLineCell(model: item,
                             pressAction: buttonTapAction,
                             aligment: alignment,
                             isDebug: isDebug)
            )
        }
    }
}
