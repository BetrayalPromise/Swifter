import Foundation

struct School: Codable {
    var name: String
    var address: String
}

struct Student: Codable {
    var name: String
    var age: Int
    var weight: Float
    var schools: [School]

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case age = "age"
        case weight = "weight"
        case schools = "school"
    }

}
