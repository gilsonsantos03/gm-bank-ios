import UIKit

public enum DepositConfigurator {

    public static func resolve(userId: String) -> UIViewController {
        let router = DepositRouter()
        let presenter = DepositPresenter()
        let interactor = DepositInteractor(presenter: presenter)
        let viewController = DepositViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
