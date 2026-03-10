import SwiftUI

struct TitleView: View {
    var body: some View {
        Text(AppStrings.appTitle)
            .foregroundColor(.black)
            .clipped()
    }
}

#Preview { TitleView() }
