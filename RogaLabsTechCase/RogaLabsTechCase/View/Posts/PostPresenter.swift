//
//  PostPresenter.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

class PostPresenter {
    var repository: PostRepository

    init(repository postRepository: PostRepository) {
        repository = postRepository
    }
}
