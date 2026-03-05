

import SwiftUI

struct CategoryRowView: View {

  
    let isHeader:   Bool
    let categories: [CakeCategory]
    @Binding var selected: Int

  
    @ObservedObject private var scrollVM = ScrollOffsetViewModel.shared

    
    private var visibilityProgress: CGFloat {
        let t = AppConstants.Scroll.categoryThreshold
        let p = min(max(scrollVM.yOffset / t, 0), 1)
        return isHeader ? p : 1 - p
    }

    private var imageSize:   CGFloat { 60  * visibilityProgress }
    private var textHeight:  CGFloat { 20  * visibilityProgress }
    private var itemOpacity: Double  { Double(visibilityProgress) }

   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppTheme.Spacing.xxl) {
                ForEach(Array(categories.enumerated()), id: \.offset) { index, cat in
                    categoryItem(cat, index: index)
                }
            }
            .padding(.horizontal, AppTheme.Spacing.lg)
            .padding(.vertical, visibilityProgress > 0 ? AppTheme.Spacing.sm : 0)
            .animation(AppTheme.Animation.easeQuick, value: scrollVM.yOffset)
        }
    }

  
    private func categoryItem(_ cat: CakeCategory, index: Int) -> some View {
        let isSelected = selected == index
        return VStack(spacing: visibilityProgress > 0 ? AppTheme.Spacing.xs : 0) {
            Image(cat.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
                .opacity(itemOpacity)
                .clipped()

            Text(cat.name)
                .font(.caption)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .black : .gray)
                .frame(height: textHeight)
                .opacity(itemOpacity)
                .clipped()
        }
        .scaleEffect(isSelected ? 1.06 : 1.0)
        .animation(AppTheme.Animation.springDefault, value: selected)
        .onTapGesture {
            withAnimation(AppTheme.Animation.springDefault) { selected = index }
        }
    }
}
