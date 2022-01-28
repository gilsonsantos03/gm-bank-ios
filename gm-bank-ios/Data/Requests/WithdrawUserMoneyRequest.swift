import Alamofire
import Foundation

enum WithdrawUserMoneyRequest: URLRequestBuilder {
    case withdraw(userId: String, amount: Double, token: String)
    
    var path: String {
        "/withdraw"
    }

    var parameters: Parameters? {
        var parameters: Parameters = [:]
        
        switch self {
        case let .withdraw(userId, amount, _):
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
        case let .withdraw(_, _, token):
            return token
        }
    }
}
