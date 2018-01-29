import Foundation

struct ShowResponse: Codable {
    let resultCount: Int
    let results: [Show]
}

struct Show: Codable {
    let artistName: String
    let longDescription: String
    let imageName: String
}

