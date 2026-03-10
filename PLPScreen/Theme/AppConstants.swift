import CoreGraphics

enum AppConstants {

    enum NavBar {
        static let height: CGFloat = 110
        static let navRowHeight: CGFloat = 106
        static let topPadding: CGFloat = 56
        static let bgOpacityThreshold: CGFloat = 0.85
        static let circleButtonSize: CGFloat = 40
        static let circleButtonTrailingPadding: CGFloat = 5
        static let titleAreaMaxHeight: CGFloat = 30
        static let titleFontSize: CGFloat = 20
    }

    enum Scroll {
        static let categoryThreshold: CGFloat = 250
        static let filterBarThreshold: CGFloat = 400
        static let navTitleTransitionStart: CGFloat = 220
        static let navTitleTransitionLength: CGFloat = 60
    }

    enum Layout {
        static let gridSpacing: CGFloat = 12
        static let gridColumns: Int = 2
        static let contentCardOffset: CGFloat = -20
        static let sectionTopRadius: CGFloat = 24
        static let categorySectionTopRadius: CGFloat = 16
        static let titleWidth: CGFloat = 250
        static let titleFontSize: CGFloat = 26
        static let titleOverlapInset: CGFloat = 10
        static let gradientLineHeight: CGFloat = 1
        static let gradientOpacityLight: Double = 0.1
        static let gradientOpacityMedium: Double = 0.5
        static let gridTopPadding: CGFloat = 14
        static let gridBottomPadding: CGFloat = 40
    }

    enum HeroBanner {
        static let height: CGFloat = 300
        static let placeholderPadding: CGFloat = 40
    }

    enum DeliveryPill {
        static let width: CGFloat = 150
        static let spacing: CGFloat = 6
        static let flagFontSize: CGFloat = 18
        static let cityLabelFontSize: CGFloat = 10
        static let cityNameSpacing: CGFloat = 2
        static let cityNameFontSize: CGFloat = 13
        static let chevronFontSize: CGFloat = 10
        static let minScale: CGFloat = 0.85
        static let scaleRange: CGFloat = 0.15
    }

    enum ProductCard {
        static let backgroundHeight: CGFloat = 160
        static let shadowOpacity: Double = 0.07
        static let shadowRadius: CGFloat = 10
        static let shadowOffsetY: CGFloat = 3
        static let infoSpacing: CGFloat = 3
        static let badgeTracking: CGFloat = 0.5
        static let nameLineLimit: Int = 2
        static let nameFontSize: CGFloat = 13
        static let priceRowSpacing: CGFloat = 6
        static let discountFontSize: CGFloat = 12
    }

    enum CartControl {
        static let padding: CGFloat = 10
        static let optionsSpacing: CGFloat = 4
        static let optionsFontSize: CGFloat = 12
        static let optionsChevronSize: CGFloat = 10
        static let optionsPaddingH: CGFloat = 10
        static let optionsPaddingV: CGFloat = 6
        static let optionsBgOpacity: Double = 0.95
        static let optionsShadowOpacity: Double = 0.1
        static let optionsShadowRadius: CGFloat = 4
        static let addIconSize: CGFloat = 15
        static let addButtonSize: CGFloat = 32
        static let stepperSpacing: CGFloat = 10
        static let stepperPaddingH: CGFloat = 10
        static let stepperPaddingV: CGFloat = 6
        static let stepperOuterPadding: CGFloat = 8
        static let stepperIconSize: CGFloat = 13
        static let stepperButtonSize: CGFloat = 28
        static let quantityFontSize: CGFloat = 14
    }

    enum FavoriteButton {
        static let iconSize: CGFloat = 14
        static let size: CGFloat = 30
        static let bgOpacity: Double = 0.9
        static let shadowOpacity: Double = 0.1
        static let shadowRadius: CGFloat = 3
        static let selectedScale: CGFloat = 1.15
        static let defaultScale: CGFloat = 1.0
        static let padding: CGFloat = 8
    }

    enum QuickFilter {
        static let titleFontSize: CGFloat = 16
        static let itemCountFontSize: CGFloat = 14
        static let resultRowPaddingV: CGFloat = 20
        static let resultRowHeight: CGFloat = 50
        static let chipsSpacing: CGFloat = 10
        static let chipsPaddingV: CGFloat = 10
        static let chipsRowHeight: CGFloat = 44
    }

    enum Category {
        static let imageSize: CGFloat = 70
        static let nameHeight: CGFloat = 40
        static let selectedScale: CGFloat = 1.06
        static let defaultScale: CGFloat = 1.0
    }

    enum Chip {
        static let contentSpacing: CGFloat = 5
        static let iconFontSize: CGFloat = 12
        static let emojiFontSize: CGFloat = 13
        static let badgeFontSize: CGFloat = 11
        static let badgePaddingH: CGFloat = 6
        static let badgePaddingV: CGFloat = 2
    }
}
