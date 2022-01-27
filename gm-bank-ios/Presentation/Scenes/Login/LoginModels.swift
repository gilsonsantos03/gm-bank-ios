import Foundation

enum LoginModels {
    
    enum LoginUser {
        struct Request {
            let email: String
            let password: String
        }
        
        enum Response {
            case success(Authentication)
            case failure(String?)
        }
        
        enum ViewModel {
            case success(Authentication)
            case failure(String?)
        }
    }
}

