//
//  PostRepository.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import Alamofire

protocol PostRepository {
    func fetchPostList() -> [PostModel]
}

class FakePostRepository: PostRepository {
    func fetchPostList() -> [PostModel] {
        return (0...4).map { PostModel(userId: $0,
                                       id: $0,
                                       title: "Placeholder Title \($0)",
                                       body: "Placeholder Body \($0)")
        }
    }
}
