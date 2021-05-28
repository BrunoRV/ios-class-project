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
                AnyView(Text("Loading"))
            case .loaded(let posts):
                AnyView(List(posts) { post in
                    //                NavigationLink(destination: CommentView(comments: [])) {
                    PostCell(post)
                    //                }
                })
            case .error(let error):
                AnyView(Text(error))
        }
    }
        .navigationTitle(Text("Posts"))
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
