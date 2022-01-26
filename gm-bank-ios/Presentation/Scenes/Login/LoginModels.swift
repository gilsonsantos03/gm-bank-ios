import Foundation

enum LoginModels {
    
    enum LoginUser {
        struct Request {
            let email: String
            let password: String
        }
        
        struct Response {
            let authentication: Authentication
        }
        
        struct ViewModel {
            let authentication: Authentication
        }
    }
}

