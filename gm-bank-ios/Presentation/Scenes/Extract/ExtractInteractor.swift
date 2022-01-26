import UIKit

protocol ExtractBusinessLogic: AnyObject {
    func showExtract(request: ExtractModels.ShowExtract.Request)
}

final class ExtractInteractor {
    private let presenter: ExtractPresentationLogic
    private let getUserExtractUseCase: GetUserExtractUseCase
    private let userId: String
    private let userToken: String

    init(presenter: ExtractPresentationLogic, getUserExtractUseCase: GetUserExtractUseCase, userId: String, userToken: String) {
        self.presenter = presenter
        self.getUserExtractUseCase = getUserExtractUseCase
        self.userId = userId
        self.userToken = userToken
    }
}

extension ExtractInteractor: ExtractBusinessLogic {
    func showExtract(request: ExtractModels.ShowExtract.Request) {
        getUserExtractUseCase.execute(userId: userId, token: userToken) { [weak self] response in
            switch response {
            case .success(let transactionHistory):
                self?.presenter.presentExtract(response: .init(extract: transactionHistory.extract))
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}
