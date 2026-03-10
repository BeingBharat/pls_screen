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
