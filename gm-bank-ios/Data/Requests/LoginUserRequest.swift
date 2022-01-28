import Alamofire
import Foundation

enum LoginUserRequest: URLRequestBuilder {
    case user(email: String, password: String)
    
    var path: String {
        "/sessions"
    }

    var parameters: Parameters? {
        var parameters: Parameters = [:]
        
        switch self {
        case let .user(email, password):
            parameters["email"] = email
            parameters["password"] = password
        }
        
        return parameters
    }

    var method: HTTPMethod {
        .post
    }
    
    var token: String? {
        nil
    }
}
