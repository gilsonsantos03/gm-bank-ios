import UIKit

public enum SignUpConfigurator {

    public static func resolve() -> UIViewController {
        let router = SignUpRouter()
        let presenter = SignUpPresenter()
        let userRepository = UserRepository()
        let registerUser = RegisterUser(repository: userRepository)
        let interactor = SignUpInteractor(presenter: presenter, registerUserUseCase: registerUser)
        let viewController = SignUpController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
