import Foundation

enum AppStrings {
    static let appTitle = "Freshly Baked Cakes"
    static let titleFontName = "Georgia-Italic"
    static let heroImageName = "heroImage"
    static let placeholderIcon = "birthday.cake.fill"
    static let deliveryCity = "Delivery City"
    static let defaultCity = "Qatar"
    static let countryFlag = "🇶🇦"
    static let allCakes = "All Cakes"
    static let dotSeparator = "•"
    static let itemCount = "500 items"

    static func formattedPrice(_ amount: Int) -> String { "$\(amount)" }
    static func formattedDiscount(_ percent: Int) -> String { "\(percent)%" }
    static func formattedOptions(_ count: Int) -> String { "\(count) options" }

    enum Icon {
        static let back = "chevron.left"
        static let search = "magnifyingglass"
        static let chevronDown = "chevron.down"
        static let plus = "plus"
        static let minus = "minus"
        static let heartFill = "heart.fill"
        static let heart = "heart"
    }
}
