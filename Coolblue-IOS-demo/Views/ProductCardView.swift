//
//  ProductCardView.swift
//  Coolblue-IOS-demo
//
//  Created by Talha Öz on 11/05/2025.
//

import SwiftUI
import Kingfisher
import SFSafeSymbols

struct ProductCardView: View {
    let product: Product

    var body: some View {
        ZStack(alignment: .topLeading) {

            VStack(alignment: .leading, spacing: 8) {

                KFImage(product.productImage)
                    .placeholder { Color(.systemGray5) }
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .clipped()
                    .padding(.bottom, 8)

                Divider()

                Text(product.productName)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .padding(.top, 8)
                    .accessibilityIdentifier("ProductName-\(product.productId)")


                HStack(alignment: .center, spacing: 2) {
                    ForEach(0..<5) { index in
                        Image(systemSymbol: starImage(for: product.rating / 2, at: index))
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.orange)
                    }
                    Text("(\(product.reviewCount))")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }

                // USPs
                Text(product.USPs.prefix(2).joined(separator: " | "))
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        if product.coolbluesChoiceInformationTitle != nil {
                            Text(product.coolbluesChoiceInformationTitle!)
                                .font(.system(size: 14))
                                 .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                        
                        Text(String(format: "%.1f", product.salesPriceIncVat))
                            .font(.title3)
                            .bold()
                    }
                
                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemSymbol: .checkmarkSealFill)
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.green)

                        Text(Strings.deliveredTomorrow)
                            .font(.caption2)
                            .foregroundColor(.green)

                        Spacer()

                        Button(action: {
                            print("Add to cart tapped for product: \(product.productName)")
                        }) {
                            Image(systemSymbol: .cartFill)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.green)
                                .clipShape(Rectangle())
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(12)
            .frame(height: 330)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 2)

            if product.coolbluesChoiceInformationTitle != nil {
                Image("coolblue_choice")
                    .resizable()
                    .frame(width: 50, height: 30)
                    .offset(x: 0, y: 8)
            }
        }
    }

    private func starImage(for rating: Double, at index: Int) -> SFSymbol {
        if Double(index) < floor(rating) {
            return .starFill
        } else if Double(index) < rating {
            return .starLeadinghalfFilled
        } else {
            return .star
        }
    }
}

#Preview {
    ProductCardView(product: Product(
        productId: 1,
        productName: "iPhone 14 Pro Max 256 GB",
        salesPriceIncVat: 1299.5,
        productImage: URL(string: "https://via.placeholder.com/300"),
        coolbluesChoiceInformationTitle: "en top klasse iphone",
        USPs: ["128 GB", "6.1-inch OLED","128 GB", "6.1-inch OLED","6.1-inch OLED"],
        reviewInformation: ReviewInformation(
            reviewSummary: ReviewSummary(
                reviewAverage: 4.7,
                reviewCount: 340
            )
        )
    ))
    .frame(width: 200, height: 400)
    .padding()
}


