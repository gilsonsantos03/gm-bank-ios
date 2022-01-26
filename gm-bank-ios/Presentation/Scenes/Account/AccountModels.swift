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
            let token: String
        }
        
        struct ViewModel {
            let userId: String
            let token: String
        }
    }
    
    enum RouteToWithdrawScene {
        struct Request {}
        
        struct Response {
            let userId: String
            let token: String
        }
        
        struct ViewModel {
            let userId: String
            let token: String
        }
    }
    
    enum RouteToExtractScene {
        struct Request {}
        
        struct Response {
            let userId: String
            let token: String
        }
        
        struct ViewModel {
            let userId: String
            let token: String
        }
    }
}
