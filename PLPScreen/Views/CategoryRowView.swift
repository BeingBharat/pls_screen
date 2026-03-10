import SwiftUI

struct CategoryRowView: View {

    let categories: [CakeCategory]
    @Binding var selected: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: AppTheme.Spacing.xxl) {
                ForEach(Array(categories.enumerated()), id: \.offset) { index, cat in
                    categoryItem(cat, index: index)
                }
            }
            .padding(.horizontal, AppTheme.Spacing.lg)
            .padding(.vertical, AppTheme.Spacing.sm)
        }
    }

    private func categoryItem(_ cat: CakeCategory, index: Int) -> some View {
        let isSelected = selected == index
        return VStack(spacing: AppTheme.Spacing.xs) {
            Image(cat.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: AppConstants.Category.imageSize, height: AppConstants.Category.imageSize)
                .clipped()

            Text(cat.name)
                .font(.caption)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .black : .gray)
                .frame(height: AppConstants.Category.nameHeight)
                .clipped()
        }
        .scaleEffect(isSelected ? AppConstants.Category.selectedScale : AppConstants.Category.defaultScale)
        .animation(AppTheme.Animation.springDefault, value: selected)
        .onTapGesture {
            withAnimation(AppTheme.Animation.springDefault) { selected = index }
        }
    }
}
