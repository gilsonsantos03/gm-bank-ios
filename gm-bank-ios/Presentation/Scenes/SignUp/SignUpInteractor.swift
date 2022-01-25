import UIKit

protocol SignUpBusinessLogic: AnyObject {
    func registerUser(request: SignUpModels.RegisterUser.Request)
}

final class SignUpInteractor {
    private let presenter: SignUpPresentationLogic
    private let registerUser: RegisterUserUseCase

    init(presenter: SignUpPresentationLogic, registerUser: RegisterUserUseCase) {
        self.presenter = presenter
        self.registerUser = registerUser
    }
}

extension SignUpInteractor: SignUpBusinessLogic {
    func registerUser(request: SignUpModels.RegisterUser.Request) {
        registerUser.execute(name: request.name, email: request.email, password: request.password) { response in
            switch response {
            case .success(let authentication):
                print(authentication.user)
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
