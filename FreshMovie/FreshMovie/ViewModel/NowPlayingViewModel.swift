import Foundation

final class NowPlayingViewModel: ObservableObject {
    @Published var movies: [BasicMovie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var dateRange: String = ""

    func fetchNowPlayingMovies() async {
        await MainActor.run {
            self.isLoading = true
            self.errorMessage = nil
        }

        do {
            let response: NowPlayingResponse = try await NetworkService.shared.request(endpoint: .getNowPlaying)
            await MainActor.run {
                self.movies = response.results
                self.dateRange = formatDateRange(response.dates.start, response.dates.end)
                self.isLoading = false
            }
        } catch {
            await MainActor.run {
                self.errorMessage = "Failed to fetch movies: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }

    private func formatDateRange(_ startDateString: String, _ endDateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let startDate = dateFormatter.date(from: startDateString),
              let endDate = dateFormatter.date(from: endDateString) else {
            return ""
        }

        dateFormatter.dateFormat = "d LLLL"
        let formattedStartDate = dateFormatter.string(from: startDate)
        let formattedEndDate = dateFormatter.string(from: endDate)

        return "\(formattedStartDate) - \(formattedEndDate)"
    }
}
