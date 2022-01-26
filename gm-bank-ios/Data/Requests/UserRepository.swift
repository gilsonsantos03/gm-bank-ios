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
                completion(.failure(error))
            }
        }
    }
    
    public func loginUser(email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void) {
        let request = LoginUserRequest.user(
            email: email,
            password: password
        )

        network.request(request: request) { (result: Result<Authentication, CustomError>) in
            switch result {
            case .success(let authentication):
                completion(.success(authentication))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func getBalance(userId: String, token: String, completion: @escaping (Result<UserBalance, CustomError>) -> Void) {
        let request = GetUserBalanceRequest.balance(
            userId: userId,
            token: token
        )

        network.request(request: request) { (result: Result<UserBalance, CustomError>) in
            switch result {
            case .success(let userBalance):
                completion(.success(userBalance))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
