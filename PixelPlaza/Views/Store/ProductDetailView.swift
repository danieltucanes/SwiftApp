//
//  ProductDetailView.swift
//  PixelPlaza
//
//  Created by Telematica on 3/06/25.
//


import SwiftUI


struct ProductDetailView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding()

                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)

                Text(product.category)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Text(String(format: "$%.2f", product.price))
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)

                Text(product.description)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
