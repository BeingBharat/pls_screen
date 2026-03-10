import Foundation

final class CakeProductRepository: CakeProductRepositoryProtocol {
    func fetchProducts() -> [CakeProduct] {
        [
            CakeProduct(name: "Product name in max 2 lines", price: 179, originalPrice: 199,
                        discount: 20, badge: "BESTSELLER", hasOptions: true, optionsCount: 4,
                        imageName: "cake1"),
            CakeProduct(name: "Product name in max 2 lines", price: 179, originalPrice: 199,
                        discount: 20, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        quantity: 1, imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight", price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW", hasOptions: true, optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake", price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight", price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW", hasOptions: true, optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake", price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight", price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW", hasOptions: true, optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake", price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight", price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW", hasOptions: true, optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake", price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
        ]
    }
}
