import Foundation

struct FindJobData: Codable {
    let data: [Datum]
}

struct Datum: Codable , Identifiable{
    let id: Int
    let title, detail: String?
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

//enum TagElement: Codable{
//    case string(String)
//    case tagClass(TagClass)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        if let x = try? container.decode(TagClass.self) {
//            self = .tagClass(x)
//            return
//        }
//        throw DecodingError.typeMismatch(TagElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for TagElement"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .string(let x):
//            try container.encode(x)
//        case .tagClass(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//extension TagElement {
//    static var allValues: [TagElement] {
//        var allValues: [TagElement] = []
//        switch (TagElement.string("")) {
//        case .string(): allValues.append(.string())
//        }
//        return allValues
//    }
//}
//
//struct TagClass: Codable {
//    let tags: String
//}
