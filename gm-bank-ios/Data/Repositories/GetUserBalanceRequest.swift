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
    
    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        
        switch self {
        case .balance(_, let token):
            header["Authorization"] = "Bearer \(token)"
        }

        return header
    }
}
