
import SwiftUI

struct ProductCardView: View {


    let product:      CakeProduct
    let onFavorite:   () -> Void
    let onIncrement:  () -> Void
    let onDecrement:  () -> Void
    let onAddToCart:  () -> Void


    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageSection
            infoSection
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.card, style: .continuous))
        .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 3)
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
            .frame(height: 160)
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
            HStack(spacing: 4) {
                Text("\(count) options")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black)
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 10).padding(.vertical, 6)
            .background(Color.white.opacity(0.95))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.1), radius: 4)
        }
        .padding(10)
    }

    private var addButton: some View {
        Button(action: onAddToCart) {
            Image(systemName: "plus")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 32, height: 32)
                .background(Color.white)
                .clipShape(Circle())
        }
        .padding(10)
    }

    private var quantityStepper: some View {
        HStack(spacing: 10) {
            stepperButton(icon: "minus", action: onDecrement)
            Text("\(product.quantity)")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.black)
                .contentTransition(.numericText())
            stepperButton(icon: "plus",  action: onIncrement)
        }
        .padding(.horizontal, 10).padding(.vertical, 6)
        .background(Color.white)
        .clipShape(Capsule())
        .padding(8)
    }

    private func stepperButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 28, height: 28)
                .background(Color.white)
                .clipShape(Circle())
        }
    }

  
    private var favoriteButton: some View {
        Button(action: onFavorite) {
            Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                .font(.system(size: 14))
                .foregroundColor(product.isFavorite ? .red : .gray)
                .frame(width: 30, height: 30)
                .background(Color.white.opacity(0.9))
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 3)
                .scaleEffect(product.isFavorite ? 1.15 : 1.0)
        }
        .padding(8)
    }

    
    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(product.badge)
                .font(AppTheme.Font.badge())
                .foregroundColor(AppTheme.Color.accentOrange)
                .tracking(0.5)

            Text(product.name)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.black)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            priceRow
        }
        .padding(.top, AppTheme.Spacing.sm)
        .padding(.horizontal, AppTheme.Spacing.xs)
        .padding(.bottom, AppTheme.Spacing.xs)
    }

    private var priceRow: some View {
        HStack(spacing: 6) {
            Text("$\(Int(product.price))")
                .font(AppTheme.Font.price())
                .foregroundColor(.black)

            Text("$\(Int(product.originalPrice))")
                .font(AppTheme.Font.priceOriginal())
                .foregroundColor(.priceOld)
                .strikethrough()

            Text("\(product.discount)%")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(AppTheme.Color.accentOrange)
        }
    }
}
