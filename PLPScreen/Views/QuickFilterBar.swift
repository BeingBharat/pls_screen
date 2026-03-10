import SwiftUI

struct QuickFilterBar: View {

    var filterOptions: [FilterOption] = FilterOptionRepository().fetchFilterOptions()

    @ObservedObject private var scrollVM = ScrollOffsetViewModel.shared

    private var resultCountProgress: CGFloat {
        1 - min(max(scrollVM.yOffset / AppConstants.Scroll.categoryThreshold, 0), 1)
    }

    var body: some View {
        VStack(spacing: 0) {
            resultCountRow
            chipsScrollRow
        }
    }

    private var resultCountRow: some View {
        HStack(spacing: AppTheme.Spacing.xs) {
            Text(AppStrings.allCakes)
                .font(.system(size: AppConstants.QuickFilter.titleFontSize, weight: .bold))
                .foregroundColor(.black)
            Text(AppStrings.dotSeparator).foregroundColor(.gray)
            Text(AppStrings.itemCount)
                .font(.system(size: AppConstants.QuickFilter.itemCountFontSize, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.horizontal, AppTheme.Spacing.sm)
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing.lg)
        .padding(.vertical, AppConstants.QuickFilter.resultRowPaddingV)
        .frame(height: AppConstants.QuickFilter.resultRowHeight * resultCountProgress)
        .opacity(Double(resultCountProgress))
        .clipped()
        .animation(AppTheme.Animation.easeFilter, value: resultCountProgress)
    }

    private var chipsScrollRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppConstants.QuickFilter.chipsSpacing) {
                ForEach(filterOptions) { option in
                    FilterChip(option: option)
                }
            }
            .padding(.horizontal, AppTheme.Spacing.lg)
            .padding(.vertical, AppConstants.QuickFilter.chipsPaddingV)
        }
        .frame(height: AppConstants.QuickFilter.chipsRowHeight)
        .clipped()
        .padding(.bottom, AppConstants.QuickFilter.chipsPaddingV)
    }
}
