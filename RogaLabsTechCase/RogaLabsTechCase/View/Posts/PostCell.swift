//
//  PostCell.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 27/05/21.
//

import SwiftUI

struct PostCell: View {
    private var _post: PostModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(_post.title).bold()
            Text(_post.body)
        }
    }

    init(_ post: PostModel) {
        _post = post
    }
}

#if DEBUG
struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(PostModel(userId: 1, id: 1, title: "Placeholder Post Title", body: "Placeholder Post Body"))
    }
}
#endif
