import Foundation

struct TopRatedResponse: Decodable {
    let results: [BasicMovie]
    let page: Int
    let totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
