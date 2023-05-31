//
//  HeaderCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import SwiftUI

struct HeaderCell<Model: HeaderItemWrap>: View {
    var model: Model
    var body: some View {
        Text(model.name)
            .font(.title2)
    }
}
