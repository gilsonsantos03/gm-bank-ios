import Foundation

public protocol GetUserExtractUseCase {
    func execute(userId: String, token: String, completion: @escaping ((Result<TransactionHistory, CustomError>) -> Void))
}

public final class GetUserExtract: GetUserExtractUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(userId: String, token: String, completion: @escaping ((Result<TransactionHistory, CustomError>) -> Void)) {
        repository.getUserExtract(userId: userId, token: token) { result in
            switch result {
            case .success(let extract):
                completion(.success(extract))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
