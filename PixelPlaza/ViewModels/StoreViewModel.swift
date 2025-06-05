//
//  StoreViewModel.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import Foundation
import Combine

class StoreViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var filteredProducts: [Product] = []

    private var cancellables = Set<AnyCancellable>()

    init(productViewModel: ProductViewModel) {
        // Escuchar cambios en searchText y productos
        Publishers.CombineLatest($searchText, productViewModel.$products)
            .map { searchText, allProducts in
                guard !searchText.isEmpty else { return allProducts }
                return allProducts.filter {
                    $0.name.localizedCaseInsensitiveContains(searchText) ||
                    $0.category.localizedCaseInsensitiveContains(searchText)
                }
            }
            .assign(to: \.filteredProducts, on: self)
            .store(in: &cancellables)
    }
}