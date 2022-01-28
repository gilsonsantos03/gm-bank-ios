import Foundation

public protocol WithdrawUserMoneyUseCase {
    func execute(userId: String, amount: Double, token: String, completion: @escaping ((Result<AccountMovimentation, CustomError>) -> Void))
}

public final class WithdrawUserMoney: WithdrawUserMoneyUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(userId: String, amount: Double, token: String, completion: @escaping ((Result<AccountMovimentation, CustomError>) -> Void)) {
        repository.withdrawUserMoney(userId: userId, amount: amount, token: token) { result in
            switch result {
            case .success(let withdraw):
                completion(.success(withdraw))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
