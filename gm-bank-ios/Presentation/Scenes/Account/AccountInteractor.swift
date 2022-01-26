import UIKit

protocol AccountBusinessLogic: AnyObject {
    func getUserBalance(request: AccountModels.GetUserBalance.Request)
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
}
