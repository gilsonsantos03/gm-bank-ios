import Foundation

public protocol RegisterUserUseCase {
    func execute(name: String, email: String, password: String, completion: @escaping ((Result<Authentication, CustomError>) -> Void))
}

public final class RegisterUser: RegisterUserUseCase {
    private let repository: UserRepositoryInterface

    public init(repository: UserRepositoryInterface) {
        self.repository = repository
    }

    public func execute(name: String, email: String, password: String, completion: @escaping ((Result<Authentication, CustomError>) -> Void)) {
        repository.registerUser(name: name, email: email, password: password) { result in
            switch result {
            case .success(let authentication):
                completion(.success(authentication))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
