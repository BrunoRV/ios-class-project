//
//  PostCell.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 27/05/21.
//

import SwiftUI

struct CommentCell: View {
    private var _comment: CommentModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(_comment.name).bold()
                Text(_comment.email)
            }
            Text(_comment.body)
        }
    }

    init(_ comment: CommentModel) {
        _comment = comment
    }
}

#if DEBUG
struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(CommentModel(postId: 1, id: 1, name: "Placeholder Name", email: "Placeholder Email", body: "Placeholder Body"))
    }
}
#endif
