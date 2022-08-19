//
//  Model.swift
//  TurkishNewsApp
//
//

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let title: String
    let url: String
    let urlToImage: URL
}
