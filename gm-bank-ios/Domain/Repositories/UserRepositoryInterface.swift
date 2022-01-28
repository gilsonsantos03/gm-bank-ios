import Foundation

public protocol UserRepositoryInterface: AnyObject {
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void)
    func loginUser(email: String, password: String, completion: @escaping (Result<Authentication, CustomError>) -> Void)
    func getUserBalance(userId: String, token: String, completion: @escaping (Result<UserBalance, CustomError>) -> Void)
    func depositUserMoney(userId: String, amount: Double, token: String, completion: @escaping (Result<AccountMovimentation, CustomError>) -> Void)
    func withdrawUserMoney(userId: String, amount: Double, token: String, completion: @escaping (Result<AccountMovimentation, CustomError>) -> Void)
    func getUserExtract(userId: String, token: String, completion: @escaping (Result<TransactionHistory, CustomError>) -> Void)
}
