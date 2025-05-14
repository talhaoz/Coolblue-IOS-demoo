//
//  Product.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import Foundation

struct Product: Identifiable, Decodable, Equatable {
    let productId: Int
    let productName: String
    let salesPriceIncVat: Double
    let productImage: URL?
    let coolbluesChoiceInformationTitle: String?
    let USPs: [String]
    let reviewInformation: ReviewInformation

    var id: Int { productId }

    var rating: Double {
        reviewInformation.reviewSummary.reviewAverage
    }

    var reviewCount: Int {
        reviewInformation.reviewSummary.reviewCount
    }
}

struct ReviewInformation: Decodable, Equatable {
    let reviewSummary: ReviewSummary
}

struct ReviewSummary: Decodable, Equatable {
    let reviewAverage: Double
    let reviewCount: Int
}


