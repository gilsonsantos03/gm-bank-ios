import Foundation

enum WithdrawModels {
    
    enum WithdrawUserMoney {
        struct Request {
            let withdrawAmount: Double
        }
        
        enum Response {
            case success
            case failure(String?)
        }
        
        enum ViewModel {
            case success
            case failure(String?)
        }
    }
}
