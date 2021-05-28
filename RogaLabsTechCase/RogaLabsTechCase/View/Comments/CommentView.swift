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
                AnyView(Text("Loading"))
            case .loaded(let comments):
                AnyView(List(comments) { comment in
                    CommentCell(comment)
                })
            case .error(let error):
                AnyView(Text(error))
            }
        }
        .navigationTitle(Text("Comments"))
        .onAppear(perform: presenter.fetchComments)
    }
}

//#if DEBUG
//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView(comments: [])
//    }
//}
//#endif
