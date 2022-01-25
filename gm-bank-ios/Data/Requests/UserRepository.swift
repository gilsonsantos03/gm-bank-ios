import Foundation

public final class UserRepository: UserRepositoryInterface {
    private let network: NetworkServiceInterface

    init(network: NetworkServiceInterface = NetworkService()) {
        self.network = network
    }
    
    public func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void) {
        let request = RegisterUserRequest.user(
            name: name,
            email: email,
            password: password
        )

        network.request(request: request) { (result: Result<Authentication, CustomError>) in
            switch result {
            case .success(let authentication):
                completion(.success(authentication))
            case .failure(let error):
                completion(.failure(.unexpected(message: error.description)))
            }
        }
    }
}
