import Alamofire
import Foundation

extension URLRequestBuilder {

    var baseURL: URL {
        return URL(string: "http://localhost:3333")!
    }

    var requestURL: URL {
        return baseURL.appendingPathComponent(path, isDirectory: false)
    }

    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        header["Content-Type"] = "application/json"

        return header
    }

    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.name)
        }
        return request
    }

    public func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
