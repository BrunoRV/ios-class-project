//
//  CommentModel.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

struct CommentModel: Identifiable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
