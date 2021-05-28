//
//  PostPresenter.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

protocol PostPresenterProtocol: AnyObject {
    func fetchPosts()
}

protocol PostPresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(posts: [PostViewModel])
}

class PostStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(posts: [PostViewModel])
    }

    @Published var state: State = .loading
}

extension PostStore: PostPresenterDelegate {
    func render(errorMessage: String) {
        self.state = .error(message: errorMessage)
    }

    func renderLoading() {
        self.state = .loading
    }

    func render(posts: [PostViewModel]) {
        self.state = .loaded(posts: posts)
    }
}

class PostPresenter: PostPresenterProtocol {
    private var _repository: PostRepositoryProtocol
    private weak var _delegate: PostPresenterDelegate?
    private var _posts: [PostModel] = []
    private var _viewPosts: [PostViewModel] = []

    init(repository: PostRepositoryProtocol, delegate: PostPresenterDelegate?) {
        _repository = repository
        _delegate = delegate
    }

    func fetchPosts() {
        _repository.fetchPostList() { [weak self] result in
            switch result {
            case .success(let posts):
                self?._posts = posts
                self?._viewPosts = self?._mapToViewPost(posts) ?? []
                self?._delegate?.render(posts: self?._viewPosts ?? [])
            case .failure(let error):
                self?._delegate?.render(errorMessage: error.localizedDescription)
            }
        }
    }

    private func _mapToViewPost(_ posts: [PostModel]) -> [PostViewModel] {
        return posts.map {
            PostViewModel(title: $0.title, body: $0.body)
        }
    }
}
