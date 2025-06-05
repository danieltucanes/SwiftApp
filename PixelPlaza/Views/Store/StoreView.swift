//
//  StoreView.swift
//  PixelPlaza
//
//  Created by Telematica on 3/06/25.
//
import SwiftUI

struct StoreView: View {
    @StateObject private var productViewModel = ProductViewModel()
    @StateObject private var storeViewModel: StoreViewModel

    init() {
        let productVM = ProductViewModel()
        _productViewModel = StateObject(wrappedValue: productVM)
        _storeViewModel = StateObject(wrappedValue: StoreViewModel(productViewModel: productVM))
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBarView(searchText: $storeViewModel.searchText)
                    .padding(.top, 10)

                Group {
                    if productViewModel.isLoading {
                        Spacer()
                        ProgressView()
                            .scaleEffect(1.5)
                        Spacer()
                    } else if let error = productViewModel.errorMessage {
                        Spacer()
                        Text(error)
                            .foregroundColor(.red)
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(storeViewModel.filteredProducts) { product in
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                        ProductCardView(product: product)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        }
                    }
                }
                .navigationTitle("Tienda")
                .onAppear {
                    productViewModel.loadProducts()
                }
            }
        }
    }
}


// Preview
struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}