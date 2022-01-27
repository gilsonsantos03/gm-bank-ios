import UIKit

protocol SignUpPresentationLogic: AnyObject {
    func presentUser(response: SignUpModels.RegisterUser.Response)
}

final class SignUpPresenter {
    var view: SignUpDisplayLogic?
}

extension SignUpPresenter: SignUpPresentationLogic {
    func presentUser(response: SignUpModels.RegisterUser.Response) {
        switch response {
        case .success(let authentication):
            view?.displayUser(viewModel: .success(authentication))
        case .failure(let error):
            view?.displayUser(viewModel: .failure(error))
        }
    }
}
