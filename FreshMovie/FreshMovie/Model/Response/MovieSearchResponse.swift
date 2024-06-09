import Foundation

struct MovieSearchResponse: Decodable {
    let page: Int
    let results: [BasicMovie]
}
