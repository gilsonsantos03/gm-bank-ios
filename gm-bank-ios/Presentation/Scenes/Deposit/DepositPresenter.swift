import UIKit

protocol DepositPresentationLogic: AnyObject {
    func presentUserMoney(response: DepositModels.DepositUserMoney.Response)
}

final class DepositPresenter {
    var view: DepositDisplayLogic?
}

extension DepositPresenter: DepositPresentationLogic {
    func presentUserMoney(response: DepositModels.DepositUserMoney.Response) {
        switch response {
        case .success:
            view?.displayUserMoney(viewModel: .success)
        case .failure(let error):
            view?.displayUserMoney(viewModel: .failure(error))
        }
    }
}
