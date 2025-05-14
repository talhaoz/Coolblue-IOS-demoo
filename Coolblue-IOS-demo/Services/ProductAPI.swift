//
//  ProductAPI.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//


import Foundation

protocol ProductAPI {
    func searchProducts(query: String, page: Int) async throws -> SearchResponse
}

final class ProductAPIClient: ProductAPI {
    private let network: NetworkService
    private let baseURL = "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search"
    
    init(network: NetworkService = URLSessionNetworkService()) {
        self.network = network
    }
    
    func searchProducts(query: String, page: Int) async throws -> SearchResponse {
        guard var comps = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        comps.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        guard let url = comps.url else {
            throw URLError(.badURL)
        }
        return try await network.fetch(from: url)
    }
}
