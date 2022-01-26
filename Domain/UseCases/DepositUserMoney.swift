import Foundation

public protocol DepositUserMoneyUseCase {
    func execute(userId: String, amount: Double, token: String, completion: @escaping ((Result<AccountMovimentation, CustomError>) -> Void))
}

public final class DepositUserMoney: DepositUserMoneyUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(userId: String, amount: Double, token: String, completion: @escaping ((Result<AccountMovimentation, CustomError>) -> Void)) {
        repository.depositUserMoney(userId: userId, amount: amount, token: token) { result in
            switch result {
            case .success(let deposit):
                completion(.success(deposit))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
