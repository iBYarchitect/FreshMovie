import Foundation

/// Organisation responsible for the creation and production of films.
struct ProductionCompany: Codable, Identifiable {
    /// The unique identifier.
    let id: Int

    /// The path to the logo image.
    let logoPath: String?

    /// The name of the production company.
    let name: String

    /// The country where the production company is based.
    let originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}
