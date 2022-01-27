import UIKit

protocol WithdrawPresentationLogic: AnyObject {
    func presentUserMoney(response: WithdrawModels.WithdrawUserMoney.Response)
}

final class WithdrawPresenter {
    var view: WithdrawDisplayLogic?
}

extension WithdrawPresenter: WithdrawPresentationLogic {
    func presentUserMoney(response: WithdrawModels.WithdrawUserMoney.Response) {
        switch response {
        case .success:
            view?.displayUserMoney(viewModel: .success)
        case .failure(let error):
            view?.displayUserMoney(viewModel: .failure(error))
        }
    }
}
