import UIKit

protocol DepositRoutingLogic: AnyObject {
    func routeToPreviousScene()
}

final class DepositRouter {
    weak var viewController: (UIViewController & DepositDisplayLogic)?
}

extension DepositRouter: DepositRoutingLogic {
    func routeToPreviousScene() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
