//
//  CommentModel.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

struct CommentModel: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}

struct CommentViewModel: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var body: String
}
