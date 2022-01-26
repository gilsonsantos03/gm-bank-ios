import UIKit

public enum WithdrawConfigurator {

    public static func resolve(userId: String, token: String) -> UIViewController {
        let router = WithdrawRouter()
        let presenter = WithdrawPresenter()
        let userRepository = UserRepository()
        let withdrawUserMoney = WithdrawUserMoney(repository: userRepository)
        let interactor = WithdrawInteractor(presenter: presenter, withdrawUserMoneyUseCase: withdrawUserMoney, userId: userId, userToken: token)
        let viewController = WithdrawViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
