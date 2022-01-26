import Foundation

public protocol LoginUserUseCase {
    func execute(email: String, password: String, completion: @escaping ((Result<Authentication, CustomError>) -> Void))
}

public final class LoginUser: LoginUserUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(email: String, password: String, completion: @escaping ((Result<Authentication, CustomError>) -> Void)) {
        repository.loginUser(email: email, password: password) { result in
            switch result {
            case .success(let authentication):
                completion(.success(authentication))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
