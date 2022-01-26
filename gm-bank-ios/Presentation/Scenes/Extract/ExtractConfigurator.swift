import UIKit

public enum ExtractConfigurator {

    public static func resolve(userId: String, token: String) -> UIViewController {
        let router = ExtractRouter()
        let presenter = ExtractPresenter()
        let userRepository = UserRepository()
        let getUserExtract = GetUserExtract(repository: userRepository)
        let interactor = ExtractInteractor(presenter: presenter, getUserExtractUseCase: getUserExtract, userId: userId, userToken: token)
        let viewController = ExtractViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
