import Alamofire
import Foundation

enum GetUserBalanceRequest: URLRequestBuilder {
    case balance(userId: String, token: String)
    
    var path: String {
        switch self {
        case .balance(let userId, _):
            return "/balance/\(userId)"
        }
    }

    var parameters: Parameters? {
        nil
    }

    var method: HTTPMethod {
        .get
    }
    
    var token: String? {
        switch self {
        case .balance(_, let token):
            return token
        }
    }
}
