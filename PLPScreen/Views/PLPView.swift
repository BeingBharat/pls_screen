import SwiftUI

struct PLPView: View {

    @StateObject private var vm = PLPViewModel()
    @ObservedObject private var scrollVM = ScrollOffsetViewModel.shared
    @State private var navBarHeight: CGFloat = 0

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.warmBg.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        HeroBannerView(scrollOffset: scrollVM.yOffset)
                        contentCard
                    }
                }
                .onScrollGeometryChange(for: CGFloat.self) { geo in
                    geo.contentOffset.y
                } action: { _, newValue in
                    scrollVM.updateScrollOffset(newValue)
                }

                TopNavBar(scrollOffset: scrollVM.yOffset)
                    .background(
                        GeometryReader { geo in
                            Color.clear.preference(key: NavBarHeightKey.self, value: geo.size.height)
                        }
                    )
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onPreferenceChange(NavBarHeightKey.self) { navBarHeight = $0 }
        }
    }

    private var titleOverlap: CGFloat {
        max(navBarHeight, 0)
    }

    private var contentCard: some View {
        VStack(spacing: 0) {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section {
                    productGrid
                        .background(Color.white)
                } header: {
                    sectionHeader
                }
            }
        }
        .offset(y: AppConstants.Layout.contentCardOffset)
    }

    private var sectionHeader: some View {
        VStack(spacing: 0) {
            HStack(spacing: AppTheme.Spacing.xs) {
                lineGradient(isLeading: true)
                TitleView()
                    .font(.custom(AppStrings.titleFontName, size: AppConstants.Layout.titleFontSize))
                    .frame(width: AppConstants.Layout.titleWidth)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: titleOverlap - AppConstants.Layout.titleOverlapInset, alignment: .center)
                lineGradient(isLeading: false)
            }
            .background(
                UnevenRoundedRectangle(
                    topLeadingRadius: AppConstants.Layout.sectionTopRadius,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: AppConstants.Layout.sectionTopRadius
                )
                .fill(Color.white)
            )

            VStack(spacing: 0) {
                CategoryRowView(
                    categories: vm.categories,
                    selected: $vm.selectedCategoryIndex
                )
                Divider()
                QuickFilterBar(filterOptions: vm.filterOptions)
                    .padding(.top, AppTheme.Spacing.md)
            }
            .background(Color.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: AppConstants.Layout.categorySectionTopRadius,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: AppConstants.Layout.categorySectionTopRadius
                )
            )
        }
    }

    private func lineGradient(isLeading: Bool) -> some View {
        LinearGradient(
            gradient: Gradient(colors: [
                .gray.opacity(AppConstants.Layout.gradientOpacityLight),
                .gray.opacity(AppConstants.Layout.gradientOpacityMedium),
                .gray.opacity(AppConstants.Layout.gradientOpacityLight),
            ]),
            startPoint: isLeading ? .trailing : .leading,
            endPoint: isLeading ? .leading : .trailing
        )
        .frame(height: AppConstants.Layout.gradientLineHeight)
        .frame(maxWidth: .infinity)
        .padding(.leading, isLeading ? AppTheme.Spacing.lg : 0)
        .padding(.trailing, isLeading ? 0 : AppTheme.Spacing.lg)
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
                    product: product,
                    onFavorite: { vm.toggleFavorite(at: idx) },
                    onIncrement: { vm.incrementQuantity(at: idx) },
                    onDecrement: { vm.decrementQuantity(at: idx) },
                    onAddToCart: { vm.setQuantityToOne(at: idx) }
                )
            }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.top, AppConstants.Layout.gridTopPadding)
        .padding(.bottom, AppConstants.Layout.gridBottomPadding)
    }
}

#Preview { PLPView() }
