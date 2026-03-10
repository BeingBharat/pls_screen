import Foundation

final class FilterOptionRepository: FilterOptionRepositoryProtocol {
    func fetchFilterOptions() -> [FilterOption] {
        [
            FilterOption(icon: "slider.horizontal.3", emoji: nil,  title: "Filter",      badge: nil),
            FilterOption(icon: "arrow.up.arrow.down", emoji: nil,  title: "Sort By",     badge: nil),
            FilterOption(icon: nil,                   emoji: "🔥", title: "Bestsellers", badge: nil),
            FilterOption(icon: nil,                   emoji: "⏰", title: "Same day",    badge: nil),
        ]
    }
}
