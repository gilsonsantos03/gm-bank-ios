import Foundation

enum SignUpModels {
    
    enum RegisterUser {
        struct Request {
            let name: String
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

