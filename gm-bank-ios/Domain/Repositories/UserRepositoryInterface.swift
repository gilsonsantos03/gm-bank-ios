import Foundation

public protocol UserRepositoryInterface: AnyObject {
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void)
}
