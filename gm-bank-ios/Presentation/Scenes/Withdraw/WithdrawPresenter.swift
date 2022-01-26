import UIKit

protocol WithdrawPresentationLogic: AnyObject {
    func presentUserMoney(response: WithdrawModels.WithdrawUserMoney.Response)
}

final class WithdrawPresenter {
    var view: WithdrawDisplayLogic?
}

extension WithdrawPresenter: WithdrawPresentationLogic {
    func presentUserMoney(response: WithdrawModels.WithdrawUserMoney.Response) {
        view?.displayUserMoney(viewModel: .init())
    }
}
