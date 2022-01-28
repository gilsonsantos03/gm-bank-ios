import Foundation

public struct Authentication: Codable {
    let user: User
    let token: String
}

public struct User: Codable {
    let userId: String
    let name: String
    let email: String
}
