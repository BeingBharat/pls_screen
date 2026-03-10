import SwiftUI

struct TopNavBar: View {

    var scrollOffset: CGFloat = 0

    private var bgOpacity: CGFloat {
        let bg = min(max(scrollOffset / AppConstants.Scroll.categoryThreshold, 0), 1)
        return bg < AppConstants.NavBar.bgOpacityThreshold ? 0 : 1
    }

    private var titleOpacity: CGFloat {
        let start = AppConstants.Scroll.navTitleTransitionStart
        let length = AppConstants.Scroll.navTitleTransitionLength
        return min(max((scrollOffset - start) / length, 0), 1)
    }

    var body: some View {
        navRow
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .opacity(bgOpacity)
                    .ignoresSafeArea(edges: .top)
                    .animation(AppTheme.Animation.easeQuick, value: bgOpacity)
            )
    }

    private var navRow: some View {
        HStack(spacing: 0) {
            circleButton(icon: AppStrings.Icon.back)
            titleArea
            Spacer()
            circleButton(icon: AppStrings.Icon.search)
        }
        .padding(.horizontal, AppTheme.Spacing.lg)
        .padding(.top, AppConstants.NavBar.topPadding)
    }

    private var titleArea: some View {
        ZStack {
            TitleView()
                .font(.system(size: AppConstants.NavBar.titleFontSize, weight: .medium, design: .rounded))
                .opacity(titleOpacity)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: AppConstants.NavBar.titleAreaMaxHeight, alignment: .init(horizontal: .leading, vertical: .center))

            deliveryPill
                .opacity(1 - titleOpacity)
                .scaleEffect(AppConstants.DeliveryPill.minScale + AppConstants.DeliveryPill.scaleRange * (1 - titleOpacity))
                .frame(width: AppConstants.DeliveryPill.width)
                .frame(maxWidth: .infinity, maxHeight: AppConstants.NavBar.titleAreaMaxHeight, alignment: .leading)
        }
    }

    private var deliveryPill: some View {
        HStack(spacing: AppConstants.DeliveryPill.spacing) {
            Text(AppStrings.countryFlag).font(.system(size: AppConstants.DeliveryPill.flagFontSize))
            VStack(alignment: .leading, spacing: 0) {
                Text(AppStrings.deliveryCity)
                    .font(.system(size: AppConstants.DeliveryPill.cityLabelFontSize))
                    .foregroundColor(.gray)
                HStack(spacing: AppConstants.DeliveryPill.cityNameSpacing) {
                    Text(AppStrings.defaultCity)
                        .font(.system(size: AppConstants.DeliveryPill.cityNameFontSize, weight: .semibold))
                        .foregroundColor(.black)
                    Image(systemName: AppStrings.Icon.chevronDown)
                        .font(.system(size: AppConstants.DeliveryPill.chevronFontSize, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.vertical, AppTheme.Spacing.sm)
        .background(Color.white)
        .clipShape(Capsule())
    }

    private func circleButton(icon: String) -> some View {
        Button { } label: {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: AppConstants.NavBar.circleButtonSize, height: AppConstants.NavBar.circleButtonSize)
                .background(Color.white)
                .clipShape(Circle())
                .padding(.trailing, AppConstants.NavBar.circleButtonTrailingPadding)
        }
    }
}
