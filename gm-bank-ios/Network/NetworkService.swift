import Alamofire
import Foundation
import SwiftyJSON

protocol NetworkServiceInterface: AnyObject {
    func request<T>(request: URLRequestBuilder, completion: @escaping (Result<T, CustomError>) -> Void) where T: Codable
    func request<T>(request: URLRequestBuilder, completion: @escaping (Result<[T], CustomError>) -> Void) where T: Codable
}

class NetworkService: NetworkServiceInterface {

    func request<T>(request: URLRequestBuilder, completion: @escaping (Result<T, CustomError>) -> Void) where T: Codable {
        AF.request(request)
            .responseDecodable(of: T.self) { result in
                if let value = result.value {
                    completion(.success(value))
                } else if result.error != nil {
                    let errorJSON = JSON(result.data)
                    completion(.failure(.unexpected(message: errorJSON["error"].string)))
                }
            }
    }

    func request<T>(request: URLRequestBuilder, completion: @escaping (Result<[T], CustomError>) -> Void) where T: Codable {
        AF.request(request)
            .responseDecodable(of: [T].self) { result in
                if let value = result.value {
                    completion(.success(value))
                } else if let error = result.error {
                    completion(.failure(.unexpected(message: error.errorDescription)))
                }
            }
    }
}
