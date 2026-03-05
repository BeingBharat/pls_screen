

import SwiftUI

struct HeroBannerView: View {

    var body: some View {
        ZStack {
            AppTheme.Color.heroBannerBackground

            if let uiImage = UIImage(named: "heroImage") {
                GeometryReader { geo in
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                        .clipped()
                }
            } else {

                Image(systemName: "birthday.cake.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(AppTheme.Color.iconPlaceholder)
                    .padding(40)
            }
        }
        .frame(height: AppConstants.Layout.heroBannerHeight)
        .clipped()
    }
}


#Preview { HeroBannerView() }
