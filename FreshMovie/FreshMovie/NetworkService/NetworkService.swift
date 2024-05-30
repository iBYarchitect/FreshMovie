import Alamofire
import Foundation

struct NetworkService {
    static let shared = NetworkService()

    func fetchMovies(endpoint: TMDBAPI) async throws -> [BasicMovie] {
        do {
            let request = AF.request(endpoint.url, method: endpoint.method, headers: endpoint.headers)
            let response = try await request.serializingDecodable(TopRatedResponse.self).value
            return response.results
        } catch {
            print("Failed to fetch movies: \(error)")
            throw error
        }
    }
}
