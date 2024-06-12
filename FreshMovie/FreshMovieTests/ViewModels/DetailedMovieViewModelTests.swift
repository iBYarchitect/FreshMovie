import XCTest

final class DetailedMovieViewModelTests: XCTestCase {
    func testGetFormattedReleaseDateWithValidDateReturnExpectedValue() {
        // Given
        let movie = DetailedMovie.Dummy.godFather
        let viewModel = DetailedMovieViewModel(movieID: movie.id)
        viewModel.movie = movie

        // When
        let formattedDate = viewModel.getFormattedReleaseDate()

        // Then
        XCTAssertEqual(formattedDate, "1972 March 14")
    }
}
