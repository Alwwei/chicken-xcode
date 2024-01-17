import Foundation

struct FindJobData: Codable {
    let data: [Datum]
}

struct Datum: Codable , Identifiable{
    let id: Int
    var title, detail: String?
    let createdAt, updatedAt: String
    let tags: [[String: String]]?
    let wages, area: String?

    enum CodingKeys: String, CodingKey {
        case id, title, detail
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case tags, wages, area
    }
}

