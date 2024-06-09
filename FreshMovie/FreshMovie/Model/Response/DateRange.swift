import Foundation

struct DateRange: Decodable {
    let start: String
    let end: String

    enum CodingKeys: String, CodingKey {
        case start = "minimum"
        case end = "maximum"
    }
}
