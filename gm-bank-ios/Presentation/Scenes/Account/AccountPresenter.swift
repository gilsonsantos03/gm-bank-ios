import UIKit

protocol AccountPresentationLogic: AnyObject {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response)
}

final class AccountPresenter {
    var view: AccountDisplayLogic?
}

extension AccountPresenter: AccountPresentationLogic {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response) {
        view?.displayUserBalance(viewModel: .init(userBalance: response.userBalance))
    }
}
