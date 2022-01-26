import UIKit

protocol AccountRoutingLogic: AnyObject {}

final class AccountRouter {
    weak var viewController: (UIViewController & AccountDisplayLogic)?
}

extension AccountRouter: AccountRoutingLogic {}
