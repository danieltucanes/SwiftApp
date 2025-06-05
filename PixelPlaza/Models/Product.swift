//
//  Product.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import Foundation


struct Product: Identifiable, Codable {
    let id: Int
    let name: String
    let category: String
    let description: String
    let price: Double
    let imageName: String
}
