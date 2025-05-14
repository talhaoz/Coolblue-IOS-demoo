//
//  ProductRepositoryImpl.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 13/05/2025.
//

final class ProductRepositoryImpl: ProductRepository {
    private let api: ProductAPI

    init(api: ProductAPI = ProductAPIClient()) {
        self.api = api
    }

    func searchProducts(query: String, page: Int) async throws -> SearchResponse {
        try await api.searchProducts(query: query, page: page)
    }
}
