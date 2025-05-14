//
//  SearchViewModelTests.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 14/05/2025.
//

import XCTest
@testable import Coolblue_IOS_demo

@MainActor
final class SearchViewModelTests: XCTestCase {

    func testSearchSuccess_setsViewStateToSuccess() async {
        let mockUseCase = SearchProductsUseCaseMock()
        let viewModel = SearchViewModel(searchUseCase: mockUseCase)
        viewModel.query = "iphone"

        await viewModel.search()

        if case .success(let products) = viewModel.viewState {
            XCTAssertEqual(products.count, 1)
            XCTAssertEqual(products.first?.productName, "Mock iPhone")
        } else {
            XCTFail("Expected success state, got \(viewModel.viewState)")
        }
    }

    func testSearchFailure_setsViewStateToFailure() async {
        let mockUseCase = SearchProductsUseCaseMock()
        mockUseCase.shouldFail = true
        let viewModel = SearchViewModel(searchUseCase: mockUseCase)
        viewModel.query = "ipad"

        await viewModel.search()

        if case .failure(let error) = viewModel.viewState {
            XCTAssertEqual(error, Strings.genericError)
        } else {
            XCTFail("Expected failure state")
        }
    }

    func testSearchWithEmptyQuery_doesNotChangeState() async {
        let mockUseCase = SearchProductsUseCaseMock()
        let viewModel = SearchViewModel(searchUseCase: mockUseCase)

        viewModel.query = "   "
        await viewModel.search()

        XCTAssertEqual(viewModel.viewState, .idle)
    }

    func testLoadMoreIfNeeded_appendsProductsToExistingList() async {
        let mockUseCase = SearchProductsUseCaseMock()
        let viewModel = SearchViewModel(searchUseCase: mockUseCase)
        viewModel.query = "macbook"

        await viewModel.search()

        mockUseCase.mockResponse = SearchResponse(
            products: [.mock2],
            currentPage: 2,
            pageCount: 2
        )

        await viewModel.loadMoreIfNeeded(currentItemId: Product.mock.id)

        if case .success(let products) = viewModel.viewState {
            XCTAssertEqual(products.count, 2)
            XCTAssertEqual(products.last?.productName, "Mock iPad")
        } else {
            XCTFail("Expected success state with appended products")
        }
    }

    func testLoadMoreIfNeeded_wrongItemId_doesNothing() async {
        let mockUseCase = SearchProductsUseCaseMock()
        let viewModel = SearchViewModel(searchUseCase: mockUseCase)
        viewModel.query = "macbook"

        await viewModel.search()
        let stateBefore = viewModel.viewState

        await viewModel.loadMoreIfNeeded(currentItemId: -1)

        XCTAssertEqual(viewModel.viewState, stateBefore)
    }
}

