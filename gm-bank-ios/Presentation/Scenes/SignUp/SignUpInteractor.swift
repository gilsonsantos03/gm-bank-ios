import UIKit

protocol SignUpBusinessLogic: AnyObject {
    func registerUser(request: SignUpModels.RegisterUser.Request)
}

final class SignUpInteractor {
    private let presenter: SignUpPresentationLogic
    private let registerUserUseCase: RegisterUserUseCase

    init(presenter: SignUpPresentationLogic, registerUserUseCase: RegisterUserUseCase) {
        self.presenter = presenter
        self.registerUserUseCase = registerUserUseCase
    }
}

extension SignUpInteractor: SignUpBusinessLogic {
    func registerUser(request: SignUpModels.RegisterUser.Request) {
        registerUserUseCase.execute(name: request.name, email: request.email, password: request.password) { [weak self] response in
            switch response {
            case .success(let authentication):
                self?.presenter.presentUser(response: .success(authentication))
            case .failure(let error):
                self?.presenter.presentUser(response: .failure(error.description))
            }
        }
    }
}
