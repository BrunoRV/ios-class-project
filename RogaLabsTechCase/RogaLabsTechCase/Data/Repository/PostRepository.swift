//
//  PostRepository.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation
import Alamofire

protocol PostRepositoryProtocol {
    func fetchPostList(completion: @escaping (Result<[PostModel], Error>) -> Void)
}

class FakePostRepository: PostRepositoryProtocol {
    func fetchPostList(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        completion(.success((1...100).map { PostModel(userId: $0,
                                                      id: $0,
                                                      title: "Placeholder Title \($0)",
                                                      body: "Placeholder Body \($0)") }
                            )
                    )
    }
}

class PostRepository: PostRepositoryProtocol {
    func fetchPostList(completion: @escaping (Result<[PostModel], Error>) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/posts").responseDecodable(of: [PostModel].self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
