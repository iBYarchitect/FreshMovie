import Alamofire
import Foundation

struct NetworkService {
    static let shared = NetworkService()

    func request<T: Decodable>(endpoint: TMDBAPI, page: Int? = nil) async throws -> T {
        var parameters = endpoint.parameters ?? [:]

        if let page {
            parameters["page"] = page
        }

        return try await performRequest(endpoint: endpoint, parameters: parameters)
    }

    private func performRequest<T: Decodable>(endpoint: TMDBAPI, parameters: [String: Any]) async throws -> T {
        do {
            let request = AF.request(
                endpoint.url,
                method: endpoint.method,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: endpoint.headers
            )

            let response = try await request.validate().serializingDecodable(T.self).value
            return response
        } catch {
            throw error
        }
    }
}
