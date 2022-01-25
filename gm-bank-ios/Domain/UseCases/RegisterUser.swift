import Foundation

public protocol RegisterUserUseCase {
    func execute(completion: @escaping ((Result<User, CustomError>) -> Void))
}

public final class RegisterUser: RegisterUserUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(completion: @escaping ((Result<User, CustomError>) -> Void)) {
        repository.registerUser { result in
            switch result {
            case .success(let teams):
                completion(.success(teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
