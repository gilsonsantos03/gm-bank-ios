import UIKit

protocol AccountPresentationLogic: AnyObject {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response)
    func presentDepositScene(response: AccountModels.RouteToDepositScene.Response)
    func presentWithdrawScene(response: AccountModels.RouteToWithdrawScene.Response)
    func presentExtractScene(response: AccountModels.RouteToExtractScene.Response)
}

final class AccountPresenter {
    var view: AccountDisplayLogic?
}

extension AccountPresenter: AccountPresentationLogic {
    func presentUserBalance(response: AccountModels.GetUserBalance.Response) {
        view?.displayUserBalance(viewModel: .init(userBalance: response.userBalance))
    }
    
    func presentDepositScene(response: AccountModels.RouteToDepositScene.Response) {
        view?.displayDepositScene(viewModel: .init(userId: response.userId, token: response.token))
    }
    
    func presentWithdrawScene(response: AccountModels.RouteToWithdrawScene.Response) {
        view?.displayWithdrawScene(viewModel: .init(userId: response.userId, token: response.token))
    }
    
    func presentExtractScene(response: AccountModels.RouteToExtractScene.Response) {
        view?.displayExtractScene(viewModel: .init(userId: response.userId, token: response.token))
    }
}
