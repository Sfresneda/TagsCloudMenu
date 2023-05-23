//
//  MenuView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct MenuView<Model: MenuItemWrap>: View {
    @Binding var items: [Model]
    var alignment: MenuAlignment
    var tapAction: ((UUID) -> Void)?
    
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
    func buildCellforItem(_ item: Model, priority: Double = .zero) -> some View {
        switch item.type {
        case .regular:
            return AnyView(
                RegularCell(model: item,
                            tapAction: tapAction,
                            isDebug: isDebug)
            )

        case .spacer:
            return AnyView(
                SpacerCell(isDebug: isDebug)
            )

        case .oneLine:
            return AnyView(
                OneLineCell(model: item,
                            tapAction: tapAction,
                            aligment: alignment,
                            isDebug: isDebug)
            )
        }
    }
}
