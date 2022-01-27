import UIKit

protocol LoginPresentationLogic: AnyObject {
    func presentUser(response: LoginModels.LoginUser.Response)
}

final class LoginPresenter {
    var view: LoginDisplayLogic?
}

extension LoginPresenter: LoginPresentationLogic {
    func presentUser(response: LoginModels.LoginUser.Response) {
        switch response {
        case .success(let authentication):
            view?.displayUser(viewModel: .success(authentication))
        case .failure(let error):
            view?.displayUser(viewModel: .failure(error))
        }
        
    }
}
