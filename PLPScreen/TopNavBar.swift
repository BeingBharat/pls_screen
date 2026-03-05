
import SwiftUI

struct TopNavBar: View {


    let transitionProgress: CGFloat
    let categories: [CakeCategory]
    @Binding var selectedCategory: Int


    @ObservedObject private var scrollVM = ScrollOffsetViewModel.shared


    private var bgOpacity:     CGFloat { min(scrollVM.yOffset / AppConstants.Scroll.categoryThreshold * 1.5, 1) }
    private var iconBgOpacity: CGFloat { 1 - min(transitionProgress * 2, 1) }
    private var whiteBgOpacity: CGFloat {
        min(max(scrollVM.yOffset / AppConstants.Scroll.categoryThreshold, 0), 1)
    }


    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                navRow
                VStack(spacing: 0) {
                    CategoryRowView(
                        isHeader: true,
                        categories: categories,
                        selected: $selectedCategory
                    )
                    .background(categoriesMinYAnchor)

                    QuickFilterBar(isHeader: true)
                        .padding(.top, AppTheme.Spacing.md)
                }
            }
        }
        .background(
            Color.white
                .opacity(whiteBgOpacity)
                .ignoresSafeArea(edges: .top)
        )
        .shadow(
            color: .black.opacity(0.08 * whiteBgOpacity),
            radius: 8, x: 0, y: 4
        )
    }


    private var navRow: some View {
        HStack(spacing: 0) {
            circleButton(icon: "chevron.left")

            titleArea

            Spacer()

            circleButton(icon: "magnifyingglass")
        }
        .padding(.horizontal, AppTheme.Spacing.lg)
        .padding(.top, 56)
        .padding(.bottom, AppTheme.Spacing.sm + 2)
    }

   
    private var titleArea: some View {
        ZStack {
            TitleView()
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .opacity(whiteBgOpacity)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: 35, alignment: .init(horizontal: .leading, vertical: .center) )
            
                .padding(.bottom,
                         10)
            

            deliveryPill
                .opacity(1 - whiteBgOpacity)
                .scaleEffect(0.85 + 0.15 * (1 - transitionProgress))
                .frame(width: 150)
                .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
        }
    }


    private var deliveryPill: some View {
        HStack(spacing: 6) {
            Text("🇶🇦").font(.system(size: 18))
            VStack(alignment: .leading, spacing: 0) {
                Text("Delivery City")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                HStack(spacing: 2) {
                    Text("Qatar")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, AppTheme.Spacing.md)
        .padding(.vertical, AppTheme.Spacing.sm)
        .background(Color.white)
        .clipShape(Capsule())
//        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 2)
    }

    
    private func circleButton(icon: String) -> some View {
        Button { } label: {
            Image(systemName: icon)
//                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .clipShape(Circle())
                .padding(.trailing,5)
//                .shadow(color: .black.opacity(0.08 * iconBgOpacity), radius: 6, x: 0, y: 2)
        }
    }

    
    private var categoriesMinYAnchor: some View {
        GeometryReader { geo in
            Color.clear.preference(
                key: CategoriesMinYKey.self,
                value: geo.frame(in: .global).minY
            )
        }
    }
}
