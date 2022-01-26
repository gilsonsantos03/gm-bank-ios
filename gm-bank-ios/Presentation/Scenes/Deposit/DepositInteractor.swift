import UIKit

protocol DepositBusinessLogic: AnyObject {
    func depositUserMoney(request: DepositModels.DepositUserMoney.Request)
}

final class DepositInteractor {
    private let presenter: DepositPresentationLogic
    private let depositUserMoneyUseCase: DepositUserMoneyUseCase
    private let userId: String
    private let userToken: String

    init(presenter: DepositPresentationLogic, depositUserMoneyUseCase: DepositUserMoneyUseCase, userId: String, userToken: String) {
        self.presenter = presenter
        self.depositUserMoneyUseCase = depositUserMoneyUseCase
        self.userId = userId
        self.userToken = userToken
    }
}

extension DepositInteractor: DepositBusinessLogic {
    func depositUserMoney(request: DepositModels.DepositUserMoney.Request) {
        depositUserMoneyUseCase.execute(userId: userId, amount: request.depositAmount, token: userToken) { [weak self] response in
            switch response {
            case .success(_):
                self?.presenter.presentUserMoney(response: .init())
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
