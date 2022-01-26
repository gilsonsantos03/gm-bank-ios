import UIKit

public enum ExtractConfigurator {

    public static func resolve() -> UIViewController {
        let router = ExtractRouter()
        let presenter = ExtractPresenter()
        let interactor = ExtractInteractor(presenter: presenter)
        let viewController = ExtractViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
