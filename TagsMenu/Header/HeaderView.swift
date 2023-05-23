//
//  HeaderView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var items: [HeaderItem]
    var itemsSpacing: CGFloat = 30
    var leadingSpacing: CGFloat = 10
    var trailingSpacing: CGFloat = 10
    var tapAction: ((UUID) -> ())?

    private var rows: [GridItem] {
        [GridItem(.flexible())]
    }

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows,
                          alignment: .center,
                          spacing: itemsSpacing) {
                    Spacer(minLength: leadingSpacing)
                    ForEach(items) { item in
                        Button {
                            withAnimation {
                                tapAction?(item.id)
                                proxy.scrollTo(item.id, anchor: .center)
                            }

                        } label: {
                            HeaderCell(title: item.title)
                        }
                    }
                    Spacer(minLength: trailingSpacing)
                }
            }
            .frame(maxHeight: 50)
            .scrollIndicators(.hidden)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(items: .constant(HeaderItemBuilder.buildMock))
    }
}
