//
//  SearchProductsUseCaseImpl.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 13/05/2025.
//

final class SearchProductsUseCaseImpl: SearchProductsUseCase {
    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
    }

    func execute(query: String, page: Int) async throws -> SearchResponse {
        try await repository.searchProducts(query: query, page: page)
    }
}
