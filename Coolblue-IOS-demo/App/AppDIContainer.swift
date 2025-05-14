//
//  AppDIContainer.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 13/05/2025.
//

import Foundation

final class AppDIContainer : ObservableObject {

    private let productAPI: ProductAPI

    private let productRepository: ProductRepository

    private let searchProductsUseCase: SearchProductsUseCase

    init() {
        self.productAPI = ProductAPIClient()
        self.productRepository = ProductRepositoryImpl(api: productAPI)
        self.searchProductsUseCase = SearchProductsUseCaseImpl(repository: productRepository)
    }

    @MainActor
    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(searchUseCase: searchProductsUseCase)
    }
}
