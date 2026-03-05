

import Foundation



final class CakeCategoryRepository: CakeCategoryRepositoryProtocol {
    func fetchCategories() -> [CakeCategory] {
        [
            CakeCategory(name: "All",        imageName: "mini_cake1"),
            CakeCategory(name: "Chocolates", imageName: "mini_cake2"),
            CakeCategory(name: "Red Velvet", imageName: "mini_cake3"),
            CakeCategory(name: "Cheese",     imageName: "mini_cakes4"),
        ]
    }
}



final class CakeProductRepository: CakeProductRepositoryProtocol {
    func fetchProducts() -> [CakeProduct] {
        [
            CakeProduct(name: "Product name in max 2 lines", price: 179, originalPrice: 199,
                        discount: 20, badge: "BESTSELLER", hasOptions: true,  optionsCount: 4,
                        imageName: "cake1"),
            CakeProduct(name: "Product name in max 2 lines", price: 179, originalPrice: 199,
                        discount: 20, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        quantity: 1, imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight",   price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW",        hasOptions: true,  optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake",       price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight",   price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW",        hasOptions: true,  optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake",       price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight",   price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW",        hasOptions: true,  optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake",       price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
            CakeProduct(name: "Classic Chocolate Delight",   price: 149, originalPrice: 179,
                        discount: 17, badge: "NEW",        hasOptions: true,  optionsCount: 3,
                        imageName: "cake1"),
            CakeProduct(name: "Strawberry Dream Cake",       price: 199, originalPrice: 239,
                        discount: 17, badge: "BESTSELLER", hasOptions: false, optionsCount: nil,
                        imageName: "cak2"),
        ]
    }
}



final class FilterOptionRepository: FilterOptionRepositoryProtocol {
    func fetchFilterOptions() -> [FilterOption] {
        [
            FilterOption(icon: "slider.horizontal.3", emoji: nil,  title: "Filter",      badge: nil),
            FilterOption(icon: "arrow.up.arrow.down", emoji: nil,  title: "Sort By",     badge: nil),
            FilterOption(icon: nil,                   emoji: "🔥", title: "Bestsellers", badge: nil),
            FilterOption(icon: nil,                   emoji: "⏰", title: "Same day",    badge: nil),
        ]
    }
}
