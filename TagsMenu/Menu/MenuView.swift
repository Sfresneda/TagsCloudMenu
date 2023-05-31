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
    var tapAction: ((AnyHashable) -> Void)?
    
    var isDebug: Bool = false

    var body: some View {
        WrappedZStackView(models: $items,
                          horizontalSpacing: 4,
                          verticalSpacing: 4,
                          alignment: alignment) { item in
            buildCellforItem(item)
                .moveAndFade(delay: Double(items.firstIndex(where: { $0 == item }) ?? 0) * 0.1,
                             direction: alignment.animationDirection)

        }
    }
}
private extension MenuView {
    func buildCellforItem(_ item: any MenuItemWrap) -> some View {
        switch item.type {
        case .regular:
            return AnyView(buildRegularCell(item))

        case .spacer:
            return AnyView(SpacerCell(isDebug: isDebug))

        case .oneLine:
            return AnyView(buildOneLineCell(item))
        }
    }
    
    func buildRegularCell<T: MenuItemWrap>(_ model: T) -> some View {
        RegularCell(model: MenuItemContentWrap(model),
                    tapAction: tapAction,
                    isDebug: isDebug)
    }
    func buildOneLineCell<T: MenuItemWrap>(_ model: T) -> some View {
        OneLineCell(model: MenuItemContentWrap(model),
                    tapAction: tapAction,
                    aligment: alignment,
                    isDebug: isDebug)
    }
}
