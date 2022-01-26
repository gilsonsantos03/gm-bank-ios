import UIKit

protocol DepositPresentationLogic: AnyObject {
    func presentUserMoney(response: DepositModels.DepositUserMoney.Response)
}

final class DepositPresenter {
    var view: DepositDisplayLogic?
}

extension DepositPresenter: DepositPresentationLogic {
    func presentUserMoney(response: DepositModels.DepositUserMoney.Response) {
        view?.displayUserMoney(viewModel: .init())
    }
}
