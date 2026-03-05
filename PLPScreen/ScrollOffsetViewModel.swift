
import SwiftUI
import Combine

final class ScrollOffsetViewModel: ObservableObject {

  
    static let shared = ScrollOffsetViewModel()
    private init() {}

    
    @Published var yOffset: CGFloat = 0


    private let topMaxHeight:    CGFloat = 150
    private let topMinHeight:    CGFloat = 80
    private let bottomMinHeight: CGFloat = 100
    private let bottomMaxHeight: CGFloat = 500

    var topVStackHeight: CGFloat {
        let p = progress(threshold: AppConstants.Scroll.categoryThreshold)
        return topMaxHeight - (topMaxHeight - topMinHeight) * p
    }

    var bottomVStackHeight: CGFloat {
        let p = progress(threshold: AppConstants.Scroll.categoryThreshold)
        return bottomMinHeight + (bottomMaxHeight - bottomMinHeight) * p
    }


    private func progress(threshold: CGFloat) -> CGFloat {
        min(max(yOffset / threshold, 0), 1)
    }
}
