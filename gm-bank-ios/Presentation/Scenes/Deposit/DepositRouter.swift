import UIKit

protocol DepositRoutingLogic: AnyObject {}

final class DepositRouter {
    weak var viewController: (UIViewController & DepositDisplayLogic)?
}

extension DepositRouter: DepositRoutingLogic {}
