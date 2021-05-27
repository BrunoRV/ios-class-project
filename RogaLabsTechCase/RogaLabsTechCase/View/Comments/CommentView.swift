//
//  CommentView.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import SwiftUI

struct CommentView: View {
    var comments: [CommentModel] = []

    var body: some View {
        NavigationView {
            List(comments) { comment in
                CommentCell(comment)
            }
        }
        .navigationTitle(Text("Comments"))
    }
}

#if DEBUG
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comments: [])
    }
}
#endif
