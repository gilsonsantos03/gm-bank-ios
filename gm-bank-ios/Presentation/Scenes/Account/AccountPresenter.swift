import UIKit

protocol AccountPresentationLogic: AnyObject {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response)
    func presentDepositScene(response: AccountModels.RouteToDepositScene.Response)
}

final class AccountPresenter {
    var view: AccountDisplayLogic?
}

extension AccountPresenter: AccountPresentationLogic {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response) {
        view?.displayUserBalance(viewModel: .init(userBalance: response.userBalance))
    }
    
    func presentDepositScene(response: AccountModels.RouteToDepositScene.Response) {
        view?.displayDepositScene(viewModel: .init(userId: response.userId))
    }
}
