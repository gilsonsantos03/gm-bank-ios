import UIKit

protocol AccountRoutingLogic: AnyObject {
    func routeToDepositScene(userId: String)
}

final class AccountRouter {
    weak var viewController: (UIViewController & AccountDisplayLogic)?
}

extension AccountRouter: AccountRoutingLogic {
    func routeToDepositScene(userId: String) {
        let depositViewController = DepositConfigurator.resolve(userId: userId)
        viewController?.navigationController?.pushViewController(depositViewController, animated: true)
    }
}
