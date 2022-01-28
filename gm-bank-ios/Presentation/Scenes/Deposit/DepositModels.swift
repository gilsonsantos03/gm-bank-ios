import Foundation

enum DepositModels {
    
    enum DepositUserMoney {
        struct Request {
            let depositAmount: Double
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
