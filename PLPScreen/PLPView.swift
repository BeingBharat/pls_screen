

import SwiftUI

struct PLPView: View {
    
    
    @StateObject private var vm = PLPViewModel()
    @ObservedObject  private var scrollVM = ScrollOffsetViewModel.shared
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.warmBg.ignoresSafeArea()
                
                scrollContent
                stickyOverlay
                navBar
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
    
    
    private var scrollContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                HeroBannerView()
                contentCard
            }
        }
        .onScrollGeometryChange(for: CGFloat.self) { geo in
            geo.contentOffset.y
        } action: { _, newValue in
            scrollVM.yOffset         = max(newValue, 0)
            vm.scrollOffset          = max(newValue, 0)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollOffsetKey.self)   { vm.scrollOffset   = max($0, 0) }
        .onPreferenceChange(CategoriesMinYKey.self) { vm.categoriesMinY = $0 }
    }
    
    
    private var contentCard: some View {
        VStack(spacing: 0) {
            TitleView()
                .font(.custom("Georgia-Italic", size: 26))
            
            
            CategoryRowView(
                isHeader: false,
                categories: vm.categories,
                selected: $vm.selectedCategoryIndex
            )
            .background(categoriesMinYAnchor)
            .opacity(vm.isCategorySticky ? 0 : 1)
            
            Divider().opacity(vm.isCategorySticky ? 0 : 1)
            
            QuickFilterBar(isHeader: false, filterOptions: vm.filterOptions)
                .padding(.top, AppTheme.Spacing.md)
                .opacity(vm.isCategorySticky ? 0 : 1)
            
            productGrid
        }
        .background(Color.white)
        .clipShape(
            RoundedCornerShape(
                radius: vm.isCategorySticky ? 0 : 20,
                corners: [.topLeft, .topRight]
            )
        )
        .animation(AppTheme.Animation.easeQuick, value: vm.isCategorySticky)
        .offset(y: -20)
    }
    
    
    private var productGrid: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible(), spacing: AppConstants.Layout.gridSpacing),
                count: AppConstants.Layout.gridColumns
            ),
            spacing: AppTheme.Spacing.lg
        ) {
            ForEach(Array(vm.products.enumerated()), id: \.offset) { idx, product in
                ProductCardView(
                    product:     product,
                    onFavorite:  { vm.toggleFavorite(at: idx) },
                    onIncrement: { vm.incrementQuantity(at: idx) },
                    onDecrement: { vm.decrementQuantity(at: idx) },
                    onAddToCart: { vm.setQuantityToOne(at: idx) }
                )
            }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.top, 14)
        .padding(.bottom, 40)
    }
    
    private var stickyOverlay: some View {
        VStack(spacing: 0) {
            Spacer().frame(height: AppConstants.NavBar.height)
        }
        .animation(AppTheme.Animation.easeQuick, value: vm.isCategorySticky)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var navBar: some View {
        TopNavBar(
            transitionProgress: vm.transitionProgress,
            categories:         vm.categories,
            selectedCategory:   $vm.selectedCategoryIndex
        )
    }
    
    private var categoriesMinYAnchor: some View {
        GeometryReader { geo in
            Color.clear.preference(
                key: CategoriesMinYKey.self,
                value: geo.frame(in: .global).minY
            )
        }
    }
}

#Preview { PLPView() }
