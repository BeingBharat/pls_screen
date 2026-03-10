import SwiftUI

struct FilterChip: View {

    var icon: String? = nil
    var emoji: String? = nil
    let title: String
    let badge: String?

    var body: some View {
        HStack(spacing: AppConstants.Chip.contentSpacing) {
            if let icon { Image(systemName: icon).font(.system(size: AppConstants.Chip.iconFontSize, weight: .medium)) }
            if let emoji { Text(emoji).font(.system(size: AppConstants.Chip.emojiFontSize)) }
            Text(title).font(AppTheme.Font.chipLabel())
            if let badge { badgeView(badge) }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.vertical, AppTheme.Spacing.sm)
        .background(AppTheme.Color.chipBackground)
        .clipShape(Capsule())
    }

    private func badgeView(_ text: String) -> some View {
        Text(text)
            .font(.system(size: AppConstants.Chip.badgeFontSize, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, AppConstants.Chip.badgePaddingH)
            .padding(.vertical, AppConstants.Chip.badgePaddingV)
            .background(AppTheme.Color.accentOrange)
            .clipShape(Capsule())
    }
}

extension FilterChip {
    init(option: FilterOption) {
        self.icon = option.icon
        self.emoji = option.emoji
        self.title = option.title
        self.badge = option.badge
    }
}

#Preview {
    HStack {
        FilterChip(icon: AppStrings.Icon.back, title: AppStrings.allCakes, badge: nil)
        FilterChip(emoji: "🔥", title: "Hot", badge: "3")
    }
    .padding()
}
