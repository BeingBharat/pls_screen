import SwiftUI

struct ProductCardView: View {

    let product: CakeProduct
    let onFavorite: () -> Void
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    let onAddToCart: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageSection
            infoSection
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.card, style: .continuous))
        .shadow(
            color: .black.opacity(AppConstants.ProductCard.shadowOpacity),
            radius: AppConstants.ProductCard.shadowRadius,
            x: 0,
            y: AppConstants.ProductCard.shadowOffsetY
        )
    }

    private var imageSection: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                cardBackground
                productImage
                cartControl
            }
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.image, style: .continuous))

            favoriteButton
        }
    }

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: AppTheme.Radius.image, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [AppTheme.Color.cardGradientTop, AppTheme.Color.cardGradientBottom],
                    startPoint: .top, endPoint: .bottom
                )
            )
            .frame(height: AppConstants.ProductCard.backgroundHeight)
    }

    private var productImage: some View {
        Image(product.imageName ?? "")
            .resizable()
            .scaledToFit()
    }

    @ViewBuilder
    private var cartControl: some View {
        HStack {
            Spacer()
            if product.hasOptions, let count = product.optionsCount {
                optionsButton(count: count)
            } else if product.quantity == 0 {
                addButton
            } else {
                quantityStepper
            }
        }
    }

    private func optionsButton(count: Int) -> some View {
        Button(action: {}) {
            HStack(spacing: AppConstants.CartControl.optionsSpacing) {
                Text(AppStrings.formattedOptions(count))
                    .font(.system(size: AppConstants.CartControl.optionsFontSize, weight: .medium))
                    .foregroundColor(.black)
                Image(systemName: AppStrings.Icon.chevronDown)
                    .font(.system(size: AppConstants.CartControl.optionsChevronSize, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, AppConstants.CartControl.optionsPaddingH)
            .padding(.vertical, AppConstants.CartControl.optionsPaddingV)
            .background(Color.white.opacity(AppConstants.CartControl.optionsBgOpacity))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(AppConstants.CartControl.optionsShadowOpacity), radius: AppConstants.CartControl.optionsShadowRadius)
        }
        .padding(AppConstants.CartControl.padding)
    }

    private var addButton: some View {
        Button(action: onAddToCart) {
            Image(systemName: AppStrings.Icon.plus)
                .font(.system(size: AppConstants.CartControl.addIconSize, weight: .bold))
                .foregroundColor(.black)
                .frame(width: AppConstants.CartControl.addButtonSize, height: AppConstants.CartControl.addButtonSize)
                .background(Color.white)
                .clipShape(Circle())
        }
        .padding(AppConstants.CartControl.padding)
    }

    private var quantityStepper: some View {
        HStack(spacing: AppConstants.CartControl.stepperSpacing) {
            stepperButton(icon: AppStrings.Icon.minus, action: onDecrement)
            Text("\(product.quantity)")
                .font(.system(size: AppConstants.CartControl.quantityFontSize, weight: .bold))
                .foregroundColor(.black)
                .contentTransition(.numericText())
            stepperButton(icon: AppStrings.Icon.plus, action: onIncrement)
        }
        .padding(.horizontal, AppConstants.CartControl.stepperPaddingH)
        .padding(.vertical, AppConstants.CartControl.stepperPaddingV)
        .background(Color.white)
        .clipShape(Capsule())
        .padding(AppConstants.CartControl.stepperOuterPadding)
    }

    private func stepperButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: AppConstants.CartControl.stepperIconSize, weight: .bold))
                .foregroundColor(.black)
                .frame(width: AppConstants.CartControl.stepperButtonSize, height: AppConstants.CartControl.stepperButtonSize)
                .background(Color.white)
                .clipShape(Circle())
        }
    }

    private var favoriteButton: some View {
        Button(action: onFavorite) {
            Image(systemName: product.isFavorite ? AppStrings.Icon.heartFill : AppStrings.Icon.heart)
                .font(.system(size: AppConstants.FavoriteButton.iconSize))
                .foregroundColor(product.isFavorite ? .red : .gray)
                .frame(width: AppConstants.FavoriteButton.size, height: AppConstants.FavoriteButton.size)
                .background(Color.white.opacity(AppConstants.FavoriteButton.bgOpacity))
                .clipShape(Circle())
                .shadow(color: .black.opacity(AppConstants.FavoriteButton.shadowOpacity), radius: AppConstants.FavoriteButton.shadowRadius)
                .scaleEffect(product.isFavorite ? AppConstants.FavoriteButton.selectedScale : AppConstants.FavoriteButton.defaultScale)
        }
        .padding(AppConstants.FavoriteButton.padding)
    }

    private var infoSection: some View {
        VStack(alignment: .leading, spacing: AppConstants.ProductCard.infoSpacing) {
            Text(product.badge)
                .font(AppTheme.Font.badge())
                .foregroundColor(AppTheme.Color.accentOrange)
                .tracking(AppConstants.ProductCard.badgeTracking)

            Text(product.name)
                .font(.system(size: AppConstants.ProductCard.nameFontSize, weight: .semibold))
                .foregroundColor(.black)
                .lineLimit(AppConstants.ProductCard.nameLineLimit)
                .fixedSize(horizontal: false, vertical: true)

            priceRow
        }
        .padding(.top, AppTheme.Spacing.sm)
        .padding(.horizontal, AppTheme.Spacing.xs)
        .padding(.bottom, AppTheme.Spacing.xs)
    }

    private var priceRow: some View {
        HStack(spacing: AppConstants.ProductCard.priceRowSpacing) {
            Text(AppStrings.formattedPrice(Int(product.price)))
                .font(AppTheme.Font.price())
                .foregroundColor(.black)

            Text(AppStrings.formattedPrice(Int(product.originalPrice)))
                .font(AppTheme.Font.priceOriginal())
                .foregroundColor(.priceOld)
                .strikethrough()

            Text(AppStrings.formattedDiscount(product.discount))
                .font(.system(size: AppConstants.ProductCard.discountFontSize, weight: .bold))
                .foregroundColor(AppTheme.Color.accentOrange)
        }
    }
}
