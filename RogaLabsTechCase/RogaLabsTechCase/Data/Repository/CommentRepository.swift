//
//  CommentRepository.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

protocol CommentRepository {
    func fetchCommentList() -> [CommentModel]
}

class FakeCommentRepository: CommentRepository {
    func fetchCommentList() -> [CommentModel] {
        return (0...4).map {
            CommentModel(postId: $0,
                         id: $0,
                         name: "Placeholder Name \($0)",
                         email: "Placeholder Email \($0)",
                         body: "Placeholder Body \($0)")
        }
    }
}
