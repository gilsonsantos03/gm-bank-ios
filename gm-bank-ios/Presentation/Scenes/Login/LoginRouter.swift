import UIKit

protocol LoginRoutingLogic: AnyObject {
    func routeToAccountScene(authentication: Authentication)
}

final class LoginRouter {
    weak var viewController: (UIViewController & LoginDisplayLogic)?
}

extension LoginRouter: LoginRoutingLogic {
    func routeToAccountScene(authentication: Authentication) {
        let accountViewController = AccountConfigurator.resolve(authentication: authentication)
        viewController?.navigationController?.pushViewController(accountViewController, animated: true)
    }
}
