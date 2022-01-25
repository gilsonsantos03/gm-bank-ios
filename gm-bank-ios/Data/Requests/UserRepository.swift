import Foundation

public final class UserRepository: UserRepositoryInterface {
    private let network: NetworkServiceInterface

    init(network: NetworkServiceInterface = NetworkService()) {
        self.network = network
    }
    
    public func registerUser(completion: @escaping (Result<User, CustomError>) -> Void) {
        let request = GetTeamsRequest()

        network.request(request: request) { (result: Result<User, CustomError>) in
            switch result {
            case .success(let teams):
                completion(.success(teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
