import Foundation

protocol CakeCategoryRepositoryProtocol {
    func fetchCategories() -> [CakeCategory]
}

protocol CakeProductRepositoryProtocol {
    func fetchProducts() -> [CakeProduct]
}

protocol FilterOptionRepositoryProtocol {
    func fetchFilterOptions() -> [FilterOption]
}
