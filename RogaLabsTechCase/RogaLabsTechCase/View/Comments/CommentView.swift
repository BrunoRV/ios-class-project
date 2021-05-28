//
//  CommentView.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import SwiftUI

struct CommentView: View {
    var presenter: CommentPresenterProtocol
    @ObservedObject var store: CommentStore

    init(presenter: CommentPresenterProtocol, store: CommentStore) {
        self.presenter = presenter
        self.store = store
    }

    var body: some View {
        NavigationView {
            switch store.state {
            case .loading:
                Text("loading")
            case .loaded(let comments):
                VStack {
                    Button("reload") {
                        presenter.fetchComments()
                    }
                    List(comments) { comment in
                        CommentCell(comment)
                    }
                }
            case .error(let error):
                VStack {
                    Text(error)
                    Button("retry") {
                        presenter.fetchComments()
                    }
                }
            }
        }
        .navigationTitle(Text("comments"))
        .onAppear(perform: presenter.fetchComments)
    }
}

#if DEBUG
struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = CommentStore()

        CommentView(presenter: CommentPresenter(postId: 1, repository: FakeCommentRepository(), delegate: store), store: store)
    }
}
#endif
