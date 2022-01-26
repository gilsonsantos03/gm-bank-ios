import UIKit

public enum LoginConfigurator {

    public static func resolve() -> UIViewController {
        let router = LoginRouter()
        let presenter = LoginPresenter()
        let userRepository = UserRepository()
        let loginUser = LoginUser(repository: userRepository)
        let interactor = LoginInteractor(presenter: presenter, loginUserUseCase: loginUser)
        let viewController = LoginController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
