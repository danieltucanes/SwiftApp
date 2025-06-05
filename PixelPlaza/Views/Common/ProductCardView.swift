//
//  ProductCardView.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 8) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.1))

                    Image(product.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 4) {
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .lineLimit(1)

                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)

                    Text(String(format: "$%.2f", product.price))
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }

                Spacer()
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.width + 90)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
        .frame(height: 260)
    }
}

