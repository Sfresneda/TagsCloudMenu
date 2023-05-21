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

    var aligment: Alignment {
        switch self {
        case .leading:
            return .topLeading
        case .trailing:
            return .topTrailing
        }
    }

    var horizontalAligment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}
