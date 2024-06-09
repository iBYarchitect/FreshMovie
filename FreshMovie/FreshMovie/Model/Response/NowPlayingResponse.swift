import Foundation

struct NowPlayingResponse: Decodable {
    let results: [BasicMovie]
    let dates: DateRange
    let page: Int
    let totalResults: Int
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results
        case dates
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
