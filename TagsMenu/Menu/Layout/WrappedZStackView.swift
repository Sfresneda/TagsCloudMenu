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
    }
}
private extension WrappedZStackView {
    func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = .zero
        var height: CGFloat = .zero

        let modelToCompare = alignment == .trailing
        ? models.first
        : models.last

        return ZStack(alignment: alignment.aligment) {
            ForEach(models) { model in
                viewGenerator(model)
                    .padding(.horizontal, horizontalSpacing)
                    .padding(.vertical, verticalSpacing)
                    .alignmentGuide(alignment.horizontalAligment,
                                    computeValue: { dimension in
                        horizontalAligmentGuide(alignment,
                                                model: model,
                                                geometry: geometry,
                                                width: &width,
                                                height: &height,
                                                dimension: dimension)
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if model == modelToCompare {
                            height = .zero
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }
    func horizontalAligmentGuide(_ alignment: MenuAlignment,
                                 model: Model,
                                 geometry: GeometryProxy,
                                 width: inout CGFloat,
                                 height: inout CGFloat,
                                 dimension: ViewDimensions) -> CGFloat {
        switch alignment {
        case .trailing:
            if abs(width + dimension.width) > geometry.size.width {
                width = .zero
                height -= dimension.height
            }
            width += dimension.width

            let result = width

            if model == self.models.first {
                width = .zero
            }
            return result

        case .leading:
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

