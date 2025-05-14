//
//  Product_test.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 14/05/2025.
//

@testable import Coolblue_IOS_demo

extension Product {
    static let mock = Product(
        productId: 1,
        productName: "Mock iPhone",
        salesPriceIncVat: 1299.0,
        productImage: nil,
        coolbluesChoiceInformationTitle: "Coolblue Choice",
        USPs: ["Great camera", "OLED screen"],
        reviewInformation: ReviewInformation(
            reviewSummary: ReviewSummary(reviewAverage: 9.5, reviewCount: 300)
        )
    )

    static let mock2 = Product(
        productId: 2,
        productName: "Mock iPad",
        salesPriceIncVat: 899.0,
        productImage: nil,
        coolbluesChoiceInformationTitle: nil,
        USPs: ["Lightweight", "Sharp display"],
        reviewInformation: ReviewInformation(
            reviewSummary: ReviewSummary(reviewAverage: 9.3, reviewCount: 200)
        )
    )
}

