import UIKit

protocol SignUpRoutingLogic: AnyObject {
    func routeToLoginScene()
    func routeToAccountScene(authentication: Authentication)
}

final class SignUpRouter {
    weak var viewController: (UIViewController & SignUpDisplayLogic)?
}

extension SignUpRouter: SignUpRoutingLogic {
    func routeToLoginScene() {
        let loginViewController = LoginConfigurator.resolve()
        viewController?.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func routeToAccountScene(authentication: Authentication) {
        let accountViewController = AccountConfigurator.resolve(authentication: authentication)
        viewController?.navigationController?.pushViewController(accountViewController, animated: true)
    }
}
