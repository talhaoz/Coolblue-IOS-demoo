//
//  SearchProductsUseCase.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 13/05/2025.
//

protocol SearchProductsUseCase {
    func execute(query: String, page: Int) async throws -> SearchResponse
}

