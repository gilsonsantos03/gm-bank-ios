import UIKit

protocol DepositBusinessLogic: AnyObject {
    
}

final class DepositInteractor {
    private let presenter: DepositPresentationLogic

    init(presenter: DepositPresentationLogic) {
        self.presenter = presenter
    }
}

extension DepositInteractor: DepositBusinessLogic {
    
}
