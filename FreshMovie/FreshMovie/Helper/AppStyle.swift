import Foundation

struct AppStyle {
    enum FontStyle {
        case heading
        case body
        case footnote

        var size: CGFloat {
            switch self {
            case .heading:
                20.0
            case .body:
                16.0
            case .footnote:
                12.0
            }
        }
    }
}
