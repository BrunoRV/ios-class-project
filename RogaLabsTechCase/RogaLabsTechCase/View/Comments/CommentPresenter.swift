//
//  CommentPresenter.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

protocol CommentPresenterProtocol: AnyObject {
    var postId: Int {get set}

    func fetchComments()
}

protocol CommentPresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(comments: [CommentViewModel])
}

class CommentStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(comments: [CommentViewModel])
    }

    @Published var state: State = .loading
}

extension CommentStore: CommentPresenterDelegate {
    func render(errorMessage: String) {
        self.state = .error(message: errorMessage)
    }

    func renderLoading() {
        self.state = .loading
    }

    func render(comments: [CommentViewModel]) {
        self.state = .loaded(comments: comments)
    }
}

class CommentPresenter: CommentPresenterProtocol {
    private var _repository: CommentRepository
    private weak var _delegate: CommentPresenterDelegate?
    private var _comments: [CommentModel] = []
    private var _viewComments: [CommentViewModel] = []
    var postId: Int

    init(postId: Int, repository: CommentRepository, delegate: CommentPresenterDelegate?) {
        _repository = repository
        _delegate = delegate
        self.postId = postId
    }

    func fetchComments() {
        _repository.fetchCommentList(postId: self.postId) { [weak self] result in
            switch result {
            case .success(let comments):
                self?._comments = comments
                self?._viewComments = self?._mapViewToComment(comments) ?? []
                self?._delegate?.render(comments: self?._viewComments ?? [])
            case .failure(let error):
                self?._delegate?.render(errorMessage: error.localizedDescription)
            }
        }
    }

    private func _mapViewToComment(_ comments: [CommentModel]) -> [CommentViewModel] {
        return comments.map {
            CommentViewModel(id: $0.id, name: $0.name, email: $0.email, body: $0.body)
        }
    }
}
