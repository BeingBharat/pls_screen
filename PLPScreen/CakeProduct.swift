

import Foundation

struct CakeProduct: Identifiable {
    let id            = UUID()
    let name:          String
    let price:         Double
    let originalPrice: Double
    let discount:      Int
    let badge:         String
    let hasOptions:    Bool
    let optionsCount:  Int?
    var isFavorite:    Bool = false
    var quantity:      Int  = 0
    var imageName:     String?
}
