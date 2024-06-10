import SwiftUI

struct StarRatingView: View {
    let rating: Double
    let size: CGFloat

    var body: some View {
        HStack {
            Image(systemName: .IconName.filledStar)
                .foregroundColor(.yellow)

            Text(String(format: "%.1f", rating))
        }
        .font(
            .system(
                size: size
            )
        )
    }
}

#Preview {
    StarRatingView(rating: 8.77, size: AppStyle.FontStyle.footnote.size)
}
