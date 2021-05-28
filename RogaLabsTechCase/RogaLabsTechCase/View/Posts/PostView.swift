//
//  PostView.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import SwiftUI

struct PostView: View {
    var presenter: PostPresenterProtocol
    @ObservedObject var store: PostStore

    init(presenter: PostPresenterProtocol, store: PostStore) {
        self.presenter = presenter
        self.store = store
    }

    var body: some View {
        NavigationView {
            switch store.state {
            case .loading:
                Text("loading")
            case .loaded(let posts):
                VStack {
                    Button("reload") {
                        presenter.fetchPosts()
                    }
                    List(posts) { post in
                        let store = CommentStore()

                        NavigationLink(destination: CommentView(presenter: CommentPresenter(postId: post.id, repository: CommentRepository(), delegate: store), store: store)) {
                            PostCell(post)
                        }
                    }
                }
            case .error(let error):
                VStack {
                    Text(error)
                    Button("retry") {
                        presenter.fetchPosts()
                    }
                }
            }
        }
        .navigationTitle(Text("posts"))
        .onAppear(perform: presenter.fetchPosts)
    }
}

#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let store = PostStore()
        
        PostView(presenter: PostPresenter(repository: FakePostRepository(), delegate: store), store: store)
    }
}
#endif
