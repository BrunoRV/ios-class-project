//
//  PostCell.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 27/05/21.
//

import SwiftUI

struct PostCell: View {
    private var _post: PostViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(_post.title).bold()
            Text(_post.body)
        }
    }

    init(_ post: PostViewModel) {
        _post = post
    }
}

#if DEBUG
struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(PostViewModel(id: 1, title: "Placeholder Post Title", body: "Placeholder Post Body"))
    }
}
#endif
