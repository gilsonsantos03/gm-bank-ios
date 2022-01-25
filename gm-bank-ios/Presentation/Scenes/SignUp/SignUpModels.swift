import Foundation

enum SignUpModels {
    
    enum RegisterUser {
        struct Request {}
        
        struct Response {
            let user: [Datum]
        }
        
        struct ViewModel {
            let users: [String]
        }
    }
}

