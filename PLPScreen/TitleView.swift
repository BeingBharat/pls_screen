

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Freshly Baked Cakes")
            .foregroundColor(.black)
            .padding(.top, AppTheme.Spacing.xl)
            .padding(.bottom, AppTheme.Spacing.md + 2)
     
            .clipped()
    }
}


#Preview { TitleView() }
