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

    func fetchMoviesForPage(page: Int, endpoint: TMDBAPI) async throws -> TopRatedResponse {
        let parameters: [String: Any] = ["page": page]
        do {
            let request = AF.request(endpoint.url, method: .get, parameters: parameters, headers: endpoint.headers)
            let response = try await request.validate().serializingDecodable(TopRatedResponse.self).value
            return response
        } catch {
            throw error
        }
    }
}
