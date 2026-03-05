

import SwiftUI

struct FilterChip: View {

    var icon:  String? = nil   // SF Symbol name
    var emoji: String? = nil   // Emoji alternative
    let title: String
    let badge: String?


    var body: some View {
        HStack(spacing: 5) {
            if let icon  { Image(systemName: icon).font(.system(size: 12, weight: .medium)) }
            if let emoji { Text(emoji).font(.system(size: 13)) }
            Text(title).font(AppTheme.Font.chipLabel())
            if let badge { badgeView(badge) }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.vertical, AppTheme.Spacing.sm)
        .background(Color(UIColor.systemGray6))
        .clipShape(Capsule())
    }


    private func badgeView(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(AppTheme.Color.accentOrange)
            .clipShape(Capsule())
    }
}


extension FilterChip {
    init(option: FilterOption) {
        self.icon  = option.icon
        self.emoji = option.emoji
        self.title = option.title
        self.badge = option.badge
    }
}


#Preview {
    HStack {
        FilterChip(icon: "slider.horizontal.3", title: "Filter",  badge: nil)
        FilterChip(emoji: "🔥",                 title: "Hot",     badge: "3")
    }
    .padding()
}
