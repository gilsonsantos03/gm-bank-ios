import Alamofire
import Foundation

enum RegisterUserRequest: URLRequestBuilder {
    case user(name: String, email: String, password: String)
    
    var path: String {
        "/users"
    }

    var parameters: Parameters? {
        var parameters: Parameters = [:]
        
        switch self {
        case let .user(name, email, password):
            parameters["name"] = name
            parameters["email"] = email
            parameters["password"] = password
        }
        
        return parameters
    }

    var method: HTTPMethod {
        .post
    }
}
