

import CoreGraphics

enum AppConstants {

    enum NavBar {
        
        static let height: CGFloat = 110
    }


    enum Scroll {

        static let categoryThreshold:    CGFloat = 200
 
        static let filterBarThreshold:   CGFloat = 400

        static let navTitleTransitionStart:  CGFloat = 220

        static let navTitleTransitionLength: CGFloat = 60
    }


    enum Layout {
        static let gridSpacing:   CGFloat = 12
        static let gridColumns:   Int     = 2
        static let heroBannerHeight: CGFloat = 300
    }
}
