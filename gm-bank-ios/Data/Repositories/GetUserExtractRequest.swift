import Alamofire
import Foundation

enum GetUserExtractRequest: URLRequestBuilder {
    case extract(userId: String, token: String)
    
    var path: String {
        switch self {
        case .extract(let userId, _):
            return "/extract/\(userId)"
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
        case .extract(_, let token):
            return token
        }
    }
}
