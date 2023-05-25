//
//  WrappedZStackView.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

struct WrappedZStackView<Model, V>: View where Model: Identifiable, Model: Equatable, V: View {
    typealias ViewGenerator = (Model) -> V

    @Binding var models: [Model]
    var horizontalSpacing: CGFloat = 4
    var verticalSpacing: CGFloat = 4
    var alignment: MenuAlignment = .trailing
    var viewGenerator: ViewGenerator

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
        .flipped(alignment == .trailing)
    }
}
private extension WrappedZStackView {
    func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = .zero
        var height: CGFloat = .zero

        return ZStack(alignment: .topLeading) {
            ForEach(models) { model in
                viewGenerator(model)
                    .flipped(alignment == .trailing)
                    .padding(.horizontal, horizontalSpacing)
                    .padding(.vertical, verticalSpacing)
                    .alignmentGuide(.leading,
                                    computeValue: { dimension in
                        horizontalAligmentGuide(model: model,
                                                geometry: geometry,
                                                width: &width,
                                                height: &height,
                                                dimension: dimension)
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if model == models.last {
                            height = .zero
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    func horizontalAligmentGuide(model: Model,
                                 geometry: GeometryProxy,
                                 width: inout CGFloat,
                                 height: inout CGFloat,
                                 dimension: ViewDimensions) -> CGFloat {
        if (abs(width - dimension.width) > geometry.size.width) {
            width = .zero
            height -= dimension.height
        }

        let result = width

        if model == self.models.last! {
            width = .zero
        } else {
            width -= dimension.width
        }
        return result
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

private extension View {
    @ViewBuilder
    func flipped(_ condition: Bool) -> some View {
        if condition {
            self.scaleEffect(x: -1, y: 1, anchor: .center)
        } else {
            self
        }
    }
}
