

import SwiftUI

enum AppTheme {


    enum Color {
        static let accentOrange = SwiftUI.Color(red: 0.95, green: 0.35, blue: 0.15)
        static let warmBackground = SwiftUI.Color(red: 0.98, green: 0.96, blue: 0.93)
        static let heroBannerBackground = SwiftUI.Color(red: 0.92, green: 0.84, blue: 0.76)
        static let cardGradientTop    = SwiftUI.Color(red: 0.95, green: 0.88, blue: 0.78)
        static let cardGradientBottom = SwiftUI.Color(red: 0.88, green: 0.78, blue: 0.65)
        static let priceOld   = SwiftUI.Color(red: 0.6, green: 0.6, blue: 0.6)
        static let iconPlaceholder = SwiftUI.Color(red: 0.75, green: 0.55, blue: 0.40).opacity(0.35)
    }


    enum Font {

        static func badge(_ size: CGFloat = 10) -> SwiftUI.Font {
            .system(size: size, weight: .bold)
        }
        static func price(_ size: CGFloat = 14) -> SwiftUI.Font {
            .system(size: size, weight: .bold)
        }
        static func priceOriginal(_ size: CGFloat = 12) -> SwiftUI.Font {
            .system(size: size)
        }
        static func chipLabel(_ size: CGFloat = 13) -> SwiftUI.Font {
            .system(size: size, weight: .medium)
        }
    }

    enum Spacing {
        static let xs:  CGFloat = 4
        static let sm:  CGFloat = 8
        static let md:  CGFloat = 12
        static let lg:  CGFloat = 16
        static let xl:  CGFloat = 24
        static let xxl: CGFloat = 28
    }


    enum Radius {
        static let card:  CGFloat = 16
        static let image: CGFloat = 14
        static let chip:  CGFloat = 20
        static let badge: CGFloat = 6
    }


    enum Animation {
        static let springDefault = SwiftUI.Animation.spring(response: 0.3, dampingFraction: 0.7)
        static let springSnappy  = SwiftUI.Animation.spring(response: 0.3, dampingFraction: 0.6)
        static let easeQuick     = SwiftUI.Animation.easeInOut(duration: 0.2)
    }
}



extension SwiftUI.Color {
    static let accentOrange    = AppTheme.Color.accentOrange
    static let warmBg          = AppTheme.Color.warmBackground
    static let priceOld        = AppTheme.Color.priceOld
}
