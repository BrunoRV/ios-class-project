//
//  CommentPresenter.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

class CommentPresenter {
    private var _commentRepository: CommentRepository

    init(commentRepository: CommentRepository) {
        _commentRepository = commentRepository
    }
}
