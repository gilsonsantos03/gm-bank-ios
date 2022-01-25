import Foundation

public protocol UserRepositoryInterface: AnyObject {
    func registerUser(completion: @escaping (Result<User, CustomError>) -> Void)
}
