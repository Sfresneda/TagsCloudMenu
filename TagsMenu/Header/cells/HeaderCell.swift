//
//  HeaderCell.swift
//  TagsMenu
//
//  Created by likeadeveloper on 23/5/23.
//

import SwiftUI

struct HeaderCell: View {
    @State var title: String
    var body: some View {
        Text(title)
            .font(.title2)
    }
}
