import Alamofire
import Foundation

enum DepositUserMoneyRequest: URLRequestBuilder {
    case deposit(userId: String, amount: Double, token: String)
    
    var path: String {
        "/deposit"
    }

    var parameters: Parameters? {
        var parameters: Parameters = [:]
        
        switch self {
        case let .deposit(userId, amount, _):
            parameters["userId"] = userId
            parameters["amount"] = amount
        }
        
        return parameters
    }

    var method: HTTPMethod {
        .post
    }
    
    var token: String? {
        switch self {
        case let .deposit(_, _, token):
            return token
        }
    }
}
