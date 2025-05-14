//
//  SearchResponse.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//


import Foundation

struct SearchResponse: Decodable {
    let products: [Product]
    let currentPage: Int
    let pageCount: Int
}

