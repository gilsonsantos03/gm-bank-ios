import UIKit

public enum AccountConfigurator {

    public static func resolve(authentication: Authentication) -> UIViewController {
        let router = AccountRouter()
        let presenter = AccountPresenter()
        let userRepository = UserRepository()
        let getUserBalance = GetUserBalance(repository: userRepository)
        let userId = authentication.user.userId
        let userToken = authentication.token
        let interactor = AccountInteractor(presenter: presenter, getUserBalanceUseCase: getUserBalance, userId: userId, userToken: userToken)
        let viewController = AccountViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
