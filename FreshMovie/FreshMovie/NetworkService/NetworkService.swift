import Alamofire
import Foundation

struct NetworkService {
    static let shared = NetworkService()

    func request<T: Decodable>(endpoint: TMDBAPI, page: Int? = nil) async throws -> T {
        let parameters: [String: Any]? = page != nil ? ["page": page ?? 1] : nil
        return try await performRequest(endpoint: endpoint, parameters: parameters)
    }

    private func performRequest<T: Decodable>(endpoint: TMDBAPI, parameters: [String: Any]? = nil) async throws -> T {
        do {
            let request = AF.request(
                endpoint.url,
                method: endpoint.method,
                parameters: parameters,
                headers: endpoint.headers
            )
            let response = try await request.validate().serializingDecodable(T.self).value
            return response
        } catch {
            print("Failed to perform request: \(error)")
            throw error
        }
    }
}
