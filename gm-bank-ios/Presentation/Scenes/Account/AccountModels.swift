import Foundation

enum AccountModels {
    
    enum GetUserBalance {
        struct Request {}
        
        struct Response {
            let userBalance: UserBalance
        }
        
        struct ViewModel {
            let userBalance: UserBalance
        }
    }
    
    enum RouteToDepositScene {
        struct Request {}
        
        struct Response {
            let userId: String
        }
        
        struct ViewModel {
            let userId: String
        }

    }
}

