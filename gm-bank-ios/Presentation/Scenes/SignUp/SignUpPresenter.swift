import UIKit

protocol SignUpPresentationLogic: AnyObject {
    func presentUser(response: SignUpModels.RegisterUser.Response)
}

final class SignUpPresenter {
    var view: SignUpDisplayLogic?
}

extension SignUpPresenter: SignUpPresentationLogic {
    func presentUser(response: SignUpModels.RegisterUser.Response) {
        view?.displayUser(viewModel: .init(authentication: response.authentication))
    }
}
