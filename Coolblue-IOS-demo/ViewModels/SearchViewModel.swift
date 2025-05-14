//
//  SearchViewModel.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var viewState: ViewState = .idle

    private var currentPage = 1
    private var totalPages = 1
    private var products: [Product] = []

    private let searchUseCase: SearchProductsUseCase

    init(searchUseCase: SearchProductsUseCase) {
        self.searchUseCase = searchUseCase
    }

    func search() async {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        viewState = .loading(products)
        do {
            let response = try await searchUseCase.execute(query: trimmed, page: 1)
            products = response.products
            currentPage = response.currentPage
            totalPages = response.pageCount
            viewState = .success(products)
        } catch {
            viewState = .failure(Strings.genericError)
        }
    }

    func loadMoreIfNeeded(currentItemId: Int) async {
        guard currentItemId == products.last?.id,
              currentPage < totalPages,
              viewState != .loading(products) else { return }

        viewState = .loading(products)
        do {
            let next = currentPage + 1
            let response = try await searchUseCase.execute(query: query, page: next)
            products.append(contentsOf: response.products)
            currentPage = response.currentPage
            totalPages  = response.pageCount
            viewState = .success(products)
        } catch {
            viewState = .failure(Strings.loadMoreError)
        }
    }
}

