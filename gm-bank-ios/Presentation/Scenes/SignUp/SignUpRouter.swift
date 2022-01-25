import UIKit

protocol SignUpRoutingLogic: AnyObject {}

final class SignUpRouter {
    weak var viewController: (UIViewController & SignUpDisplayLogic)?
}

extension SignUpRouter: SignUpRoutingLogic {}
