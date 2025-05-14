//
//  SearchProductsUseCaseMock.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 14/05/2025.
//

import Foundation
@testable import Coolblue_IOS_demo

final class SearchProductsUseCaseMock: SearchProductsUseCase {
    var shouldFail = false
    var mockResponse = SearchResponse(products: [.mock], currentPage: 1, pageCount: 2)

    func execute(query: String, page: Int) async throws -> SearchResponse {
        if shouldFail {
            throw URLError(.badServerResponse)
        }
        return mockResponse
    }
}
