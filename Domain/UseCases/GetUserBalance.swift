import Foundation

public protocol GetUserBalanceUseCase {
    func execute(userId: String, token: String, completion: @escaping ((Result<UserBalance, CustomError>) -> Void))
}

public final class GetUserBalance: GetUserBalanceUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(userId: String, token: String, completion: @escaping ((Result<UserBalance, CustomError>) -> Void)) {
        repository.getUserBalance(userId: userId, token: token) { result in
            switch result {
            case .success(let userBalance):
                completion(.success(userBalance))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
