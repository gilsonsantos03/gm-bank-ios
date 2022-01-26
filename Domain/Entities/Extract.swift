
import Foundation

struct TransactionHistory: Codable {
    let extract: [Extract]
}

struct Extract: Codable {
    let action: Action
    let amount: Int
    let date, id: String

    enum CodingKeys: String, CodingKey {
        case action, amount, date
        case id = "_id"
    }
}

enum Action: String, Codable {
    case deposit = "DEPOSIT"
    case withdrawn = "WITHDRAWN"
}
