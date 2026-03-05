
import SwiftUI

struct QuickFilterBar: View {


    let isHeader: Bool
    var filterOptions: [FilterOption] = FilterOptionRepository().fetchFilterOptions()

    
    @ObservedObject private var scrollVM = ScrollOffsetViewModel.shared

   
    private var visibilityProgress: CGFloat {
        let t = AppConstants.Scroll.filterBarThreshold
        let p = min(max(scrollVM.yOffset / t, 0), 1)
        return isHeader ? p : 1 - p
    }

    private var opacity:       Double  { Double(visibilityProgress) }
    private var topRowHeight:  CGFloat { 30 * visibilityProgress }
    private var chipsRowHeight: CGFloat { 44 * visibilityProgress }


    var body: some View {
        VStack(spacing: 0) {
            if !isHeader {
                resultCountRow
            }
            chipsScrollRow
        }
        .animation(AppTheme.Animation.easeQuick, value: scrollVM.yOffset)
    }

 
    private var resultCountRow: some View {
        HStack(spacing: 4) {
            Text("All Cakes")
                .font(.system(size: 14, weight: .medium))
                .strikethrough()
                .foregroundColor(.gray)
            Text("•").foregroundColor(.gray)
            Text("500 items")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, AppTheme.Spacing.sm)
                .padding(.vertical, 3)
                .overlay(
                    RoundedRectangle(cornerRadius: AppTheme.Radius.badge)
                        .stroke(Color.blue.opacity(0.5), lineWidth: 1.5)
                )
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing.lg)
        .padding(.bottom, visibilityProgress > 0 ? AppTheme.Spacing.sm + 2 : 0)
        .frame(height: topRowHeight)
        .opacity(opacity)
        .clipped()
    }

   
    private var chipsScrollRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filterOptions) { option in
                    FilterChip(option: option)
                }
            }
            .padding(.horizontal, AppTheme.Spacing.lg)
            .padding(.vertical, visibilityProgress > 0 ? AppTheme.Spacing.sm + 2 : 0)
        }
        .frame(height: chipsRowHeight)
        .opacity(opacity)
        .clipped()
        .padding(.bottom, AppTheme.Spacing.sm + 2)
    }
}
