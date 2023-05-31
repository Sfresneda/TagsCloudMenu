//
//  MoveAndFadeAnimation.swift
//  TagsMenu
//
//  Created by likeadeveloper on 25/5/23.
//

import SwiftUI

enum AnimationDirection {
    case leading
    case trailing

    var position: CGFloat {
        switch self {
        case .leading: return -200
        case .trailing: return 200
        }
    }
}

struct MoveAndFade: ViewModifier {
    let delay: Double
    let direction: AnimationDirection

    @State private var isLoaded = false
    var destination: CGFloat {
        direction.position
    }
    func body(content: Content) -> some View {
        content
            .opacity(isLoaded ? 1 : .zero)
            .offset(x: isLoaded ? .zero : destination, y: .zero)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5).delay(delay)) {
                    isLoaded = true
                }
            }
    }
}

extension View {
    func moveAndFade(delay: Double, direction: AnimationDirection) -> some View {
        self.modifier(MoveAndFade(delay: delay,
                                  direction: direction))
    }
}
