import Foundation

public protocol UserRepositoryInterface: AnyObject {
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void)
    func loginUser(email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void)
    func getBalance(userId: String, token: String, completion: @escaping (Result<UserBalance, CustomError>) -> Void)
}
