//
//  CommentRepository.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import Alamofire

protocol CommentRepositoryProtocol {
    func fetchCommentList(postId: Int, completion: @escaping (Result<[CommentModel], Error>) -> Void)
}

class FakeCommentRepository: CommentRepositoryProtocol {
    func fetchCommentList(postId: Int, completion: @escaping (Result<[CommentModel], Error>) -> Void) {
        completion(.success((0...4).map {
            CommentModel(postId: 1,
                         id: $0,
                         name: "Placeholder Name \($0)",
                         email: "Placeholder Email \($0)",
                         body: "Placeholder Body \($0)")
        }))
    }
}

class CommentRepository: CommentRepositoryProtocol {
    func fetchCommentList(postId: Int, completion: @escaping (Result<[CommentModel], Error>) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/posts/\(postId)/comments")
            .responseDecodable(of: [CommentModel].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }

        }
    }
}
