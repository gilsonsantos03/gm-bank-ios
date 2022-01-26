import UIKit

public enum DepositConfigurator {

    public static func resolve(userId: String, token: String) -> UIViewController {
        let router = DepositRouter()
        let presenter = DepositPresenter()
        let userRepository = UserRepository()
        let depositUserMoney = DepositUserMoney(repository: userRepository)
        let interactor = DepositInteractor(presenter: presenter, depositUserMoneyUseCase: depositUserMoney, userId: userId, userToken: token)
        let viewController = DepositViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
