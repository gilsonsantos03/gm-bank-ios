import UIKit

protocol DepositPresentationLogic: AnyObject {
}

final class DepositPresenter {
    var view: DepositDisplayLogic?
}

extension DepositPresenter: DepositPresentationLogic {
    
}
