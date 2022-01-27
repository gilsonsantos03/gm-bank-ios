import UIKit

protocol LoginBusinessLogic: AnyObject {
    func loginUser(request: LoginModels.LoginUser.Request)
}

final class LoginInteractor {
    private let presenter: LoginPresentationLogic
    private let loginUserUseCase: LoginUserUseCase

    init(presenter: LoginPresentationLogic, loginUserUseCase: LoginUserUseCase) {
        self.presenter = presenter
        self.loginUserUseCase = loginUserUseCase
    }
}

extension LoginInteractor: LoginBusinessLogic {
    func loginUser(request: LoginModels.LoginUser.Request) {
        loginUserUseCase.execute(email: request.email, password: request.password) { [weak self] response in
            switch response {
            case .success(let authentication):
                self?.presenter.presentUser(response: .success(authentication))
            case .failure(let error):
                self?.presenter.presentUser(response: .failure(error.description))
            }
        }
    }
}
