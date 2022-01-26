import UIKit

protocol LoginPresentationLogic: AnyObject {
    func presentUser(response: LoginModels.LoginUser.Response)
}

final class LoginPresenter {
    var view: LoginDisplayLogic?
}

extension LoginPresenter: LoginPresentationLogic {
    func presentUser(response: LoginModels.LoginUser.Response) {
        view?.displayUser(viewModel: .init(authentication: response.authentication))
    }
}
