//
//  SearchView.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import SwiftUI
import SFSafeSymbols

struct SearchView: View {
    @StateObject private var viewModel: SearchViewModel

    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.viewState {
                    case .idle:
                        startSearchingView()

                    case .loading(let products):
                        loadingView(products)

                    case .success(let products):
                        showProductsView(products)

                    case .failure(let error):
                        showErrorView(error)
                }
            }
            .navigationTitle(Strings.appTitle)
            .searchable(text: $viewModel.query, prompt: Strings.searchProducts)
            .onSubmit(of: .search) {
                Task { await viewModel.search() }
            }
        }
    }
    
    @ViewBuilder
    private func startSearchingView() -> some View {
        VStack(spacing: 12) {
            Image(systemSymbol: .magnifyingglass)
                .font(.system(size: 40))
                .foregroundColor(.gray)

            Text(Strings.startSearching)
                .foregroundColor(.secondary)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func loadingView(_ products: [Product]) -> some View {
        if products.isEmpty {
            VStack {
                Spacer()
                ProgressView(Strings.loading)
                Spacer()
            }
        } else {
            productListView(products)
            ProgressView().padding()
        }
    }
    
    @ViewBuilder
    private func showProductsView(_ products: [Product]) -> some View {
        if products.isEmpty {
            VStack {
                Spacer()
                Text(Strings.noProductsFound)
                    .foregroundColor(.secondary)
                Spacer()
            }
        } else {
            productListView(products)
        }
    }

    @ViewBuilder
    private func productListView(_ products: [Product]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(products) { product in
                    ProductCardView(product: product)
                        .onAppear {
                            Task {
                                await viewModel.loadMoreIfNeeded(currentItemId: product.id)
                            }
                        }
                }
            }
            .padding(12)
        }
    }
    
    @ViewBuilder
    private func showErrorView(_ error: String) -> some View {
        VStack {
            Spacer()
            Text(error)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
            Button(Strings.tryAgain) {
                Task { await viewModel.search() }
            }
            Spacer()
        }
    }
}


