import SwiftUI

struct HeroBannerView: View {

    var scrollOffset: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white

            if let uiImage = UIImage(named: AppStrings.heroImageName) {
                GeometryReader { geo in
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                        .opacity(computeOpacity())
                        .clipped()
                }
            } else {
                Image(systemName: AppStrings.placeholderIcon)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(AppTheme.Color.iconPlaceholder)
                    .padding(AppConstants.HeroBanner.placeholderPadding)
                    .opacity(computeOpacity())
            }
        }
        .frame(height: AppConstants.HeroBanner.height)
        .clipped()
    }

    private func computeOpacity() -> Double {
        let threshold = AppConstants.HeroBanner.height
        let progress = scrollOffset / threshold
        return Double(max(0, 1 - progress))
    }
}
