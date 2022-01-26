import UIKit

protocol WithdrawBusinessLogic: AnyObject {
    func withdrawUserMoney(request: WithdrawModels.WithdrawUserMoney.Request)
}

final class WithdrawInteractor {
    private let presenter: WithdrawPresentationLogic
    private let withdrawUserMoneyUseCase: WithdrawUserMoneyUseCase
    private let userId: String
    private let userToken: String

    init(presenter: WithdrawPresentationLogic, withdrawUserMoneyUseCase: WithdrawUserMoneyUseCase, userId: String, userToken: String) {
        self.presenter = presenter
        self.withdrawUserMoneyUseCase = withdrawUserMoneyUseCase
        self.userId = userId
        self.userToken = userToken
    }
}

extension WithdrawInteractor: WithdrawBusinessLogic {
    func withdrawUserMoney(request: WithdrawModels.WithdrawUserMoney.Request) {
        withdrawUserMoneyUseCase.execute(userId: userId, amount: request.withdrawAmount, token: userToken) { [weak self] response in
            switch response {
            case .success(_):
                self?.presenter.presentUserMoney(response: .init())
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
