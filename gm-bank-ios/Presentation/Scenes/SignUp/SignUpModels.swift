import Foundation

enum SignUpModels {
    
    enum RegisterUser {
        struct Request {
            let name: String
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

