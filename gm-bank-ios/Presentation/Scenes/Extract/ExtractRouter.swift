import UIKit

protocol ExtractRoutingLogic: AnyObject {
    func routeToPreviousScene()
}

final class ExtractRouter {
    weak var viewController: (UIViewController & ExtractDisplayLogic)?
}

extension ExtractRouter: ExtractRoutingLogic {
    func routeToPreviousScene() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

