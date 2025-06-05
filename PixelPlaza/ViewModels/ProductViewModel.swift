//
//  ProductViewModel.swift
//  PixelPlaza
//
//  Created by Telematica on 3/06/25.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func loadProducts() {
        isLoading = true
        errorMessage = nil

        DispatchQueue.global(qos: .background).async {
            guard let url = Bundle.main.url(forResource: "products", withExtension: "json"),
                  let data = try? Data(contentsOf: url),
                  let products = try? JSONDecoder().decode([Product].self, from: data) else {
                DispatchQueue.main.async {
                    self.errorMessage = "No se pudo cargar la lista de productos."
                    self.isLoading = false
                }
                return
            }
            DispatchQueue.main.async {
                self.products = products
                self.isLoading = false
            }
        }
    }
}
