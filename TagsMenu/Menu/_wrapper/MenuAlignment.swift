//
//  MenuAlignment.swift
//  TagsMenu
//
//  Created by likeadeveloper on 21/5/23.
//

import SwiftUI

enum MenuAlignment {
    case leading
    case trailing

    var animationDirection: AnimationDirection {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}
