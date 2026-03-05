
import SwiftUI
import Combine

@MainActor
final class PLPViewModel: ObservableObject {


    @Published var categories:     [CakeCategory] = []
    @Published var products:       [CakeProduct]  = []
    @Published var filterOptions:  [FilterOption] = []
    @Published var selectedCategoryIndex: Int = 0
    @Published var scrollOffset:   CGFloat = 0
    @Published var categoriesMinY: CGFloat = 999


    private let categoryRepo:     CakeCategoryRepositoryProtocol
    private let productRepo:      CakeProductRepositoryProtocol
    private let filterOptionsRepo: FilterOptionRepositoryProtocol


    init(
        categoryRepo:      CakeCategoryRepositoryProtocol = CakeCategoryRepository(),
        productRepo:       CakeProductRepositoryProtocol  = CakeProductRepository(),
        filterOptionsRepo: FilterOptionRepositoryProtocol = FilterOptionRepository()
    ) {
        self.categoryRepo      = categoryRepo
        self.productRepo       = productRepo
        self.filterOptionsRepo = filterOptionsRepo
        loadData()
    }


    func loadData() {
        categories    = categoryRepo.fetchCategories()
        products      = productRepo.fetchProducts()
        filterOptions = filterOptionsRepo.fetchFilterOptions()
    }

    func selectCategory(_ index: Int) {
        withAnimation(AppTheme.Animation.springDefault) {
            selectedCategoryIndex = index
        }
    }

    func toggleFavorite(at index: Int) {
        withAnimation(AppTheme.Animation.springSnappy) {
            products[index].isFavorite.toggle()
        }
    }

    func incrementQuantity(at index: Int) {
        withAnimation(AppTheme.Animation.springSnappy) {
            products[index].quantity += 1
        }
    }

    func decrementQuantity(at index: Int) {
        withAnimation(AppTheme.Animation.springSnappy) {
            if products[index].quantity > 0 { products[index].quantity -= 1 }
        }
    }

    func setQuantityToOne(at index: Int) {
        withAnimation(AppTheme.Animation.springSnappy) {
            products[index].quantity = 1
        }
    }

    var transitionProgress: CGFloat {
        let start  = AppConstants.Scroll.navTitleTransitionStart
        let length = AppConstants.Scroll.navTitleTransitionLength
        return min(max((scrollOffset - start) / length, 0), 1)
    }

    var isCategorySticky: Bool {
        categoriesMinY <= AppConstants.NavBar.height
    }
}
