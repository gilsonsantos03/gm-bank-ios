
import Foundation

public struct TransactionHistory: Codable {
    let extract: [Extract]
}

public struct Extract: Codable {
    let action: Action
    let amount: Double
    let date, id: String

    enum CodingKeys: String, CodingKey {
        case action, amount, date
        case id = "_id"
    }
}

public enum Action: String, Codable {
    case deposit = "DEPÓSITO"
    case withdrawn = "RETIRADA"
}
