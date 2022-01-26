import UIKit

protocol AccountRoutingLogic: AnyObject {
    func routeToDepositScene(userId: String, token: String)
    func routeToWithdrawScene(userId: String, token: String)
}

final class AccountRouter {
    weak var viewController: (UIViewController & AccountDisplayLogic)?
}

extension AccountRouter: AccountRoutingLogic {
    func routeToDepositScene(userId: String, token: String) {
        let depositViewController = DepositConfigurator.resolve(userId: userId, token: token)
        viewController?.navigationController?.pushViewController(depositViewController, animated: true)
    }
    
    func routeToWithdrawScene(userId: String, token: String) {
        let withdrawViewController = WithdrawConfigurator.resolve(userId: userId, token: token)
        viewController?.navigationController?.pushViewController(withdrawViewController, animated: true)
    }
}
