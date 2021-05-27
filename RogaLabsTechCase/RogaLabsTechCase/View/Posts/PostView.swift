//
//  PostView.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import SwiftUI

struct PostView: View {
    var posts = [PostModel]()

    var body: some View {
        NavigationView {
            List(posts) { post in
                NavigationLink(destination: CommentView(comments: [])) {
                    PostCell(post)
                }
            }
        }
        .navigationTitle(Text("Posts"))
    }
}

#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
#endif
