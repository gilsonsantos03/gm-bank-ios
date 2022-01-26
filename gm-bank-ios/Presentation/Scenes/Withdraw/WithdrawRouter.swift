import UIKit

protocol WithdrawRoutingLogic: AnyObject {
    func routeToPreviousScene()
}

final class WithdrawRouter {
    weak var viewController: (UIViewController & WithdrawDisplayLogic)?
}

extension WithdrawRouter: WithdrawRoutingLogic {
    func routeToPreviousScene() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
