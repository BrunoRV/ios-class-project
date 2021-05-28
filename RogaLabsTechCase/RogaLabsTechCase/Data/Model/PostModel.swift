//
//  PostModel.swift
//  RogaLabsTechCase
//
//  Created by Bruno Ribeiro on 26/05/21.
//

import Foundation

struct PostModel: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct PostViewModel: Identifiable {
    var id = UUID()
    var title: String
    var body: String
}
