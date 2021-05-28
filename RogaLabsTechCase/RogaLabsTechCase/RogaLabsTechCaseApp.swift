//
//  RogaLabsTechCaseApp.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import SwiftUI

@main
struct RogaLabsTechCaseApp: App {
    var body: some Scene {
        WindowGroup {
            let store = PostStore()
            PostView(presenter: PostPresenter(repository: PostRepository(), delegate: store), store: store)
        }
    }
}
