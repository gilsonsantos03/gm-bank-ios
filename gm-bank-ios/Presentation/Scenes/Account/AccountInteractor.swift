import UIKit

protocol AccountBusinessLogic: AnyObject {
    func getUserBalance(request: AccountModels.GetUserBalance.Request)
    func routeToDepositScene(request: AccountModels.RouteToDepositScene.Request)
    func routeToWithdrawScene(request: AccountModels.RouteToDepositScene.Request)
    func routeToExtractScene(request: AccountModels.RouteToExtractScene.Request)
}

final class AccountInteractor {
    private let presenter: AccountPresentationLogic
    private let getUserBalanceUseCase: GetUserBalanceUseCase
    private let userId: String
    private let userToken: String

    init(presenter: AccountPresentationLogic, getUserBalanceUseCase: GetUserBalanceUseCase, userId: String, userToken: String) {
        self.presenter = presenter
        self.getUserBalanceUseCase = getUserBalanceUseCase
        self.userId = userId
        self.userToken = userToken
    }
}

extension AccountInteractor: AccountBusinessLogic {
    func getUserBalance(request: AccountModels.GetUserBalance.Request) {
        getUserBalanceUseCase.execute(userId: userId, token: userToken) { [weak self] response in
            switch response {
            case .success(let userBalance):
                self?.presenter.presentUserBalance(response: .init(userBalance: userBalance))
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
    
    func routeToDepositScene(request: AccountModels.RouteToDepositScene.Request) {
        presenter.presentDepositScene(response: .init(userId: userId, token: userToken))
    }
    
    func routeToWithdrawScene(request: AccountModels.RouteToDepositScene.Request) {
        presenter.presentWithdrawScene(response: .init(userId: userId, token: userToken))
    }
    
    func routeToExtractScene(request: AccountModels.RouteToExtractScene.Request) {
        presenter.presentExtractScene(response: .init(userId: userId, token: userToken))
    }
}
