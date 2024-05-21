// 


import Foundation

public class iSKApiClientHelper {
    public static let shared = iSKApiClientHelper()
    
    private init() {}

    /**
        リクエストの作成から結果の返却までを行う
     */
    public static func fetch(
        _ url: URL,
        _ method: String,
        _ headers: [String: String]?,
        _ body: Encodable? = nil
    ) async -> Result<Data, Error> {
        let request = self.createUrlRequest(url, method, headers, body)
        return await sendRequest(request)
    }
    
    /*
     URLRequestを作成する
    */
    static private func createUrlRequest(
        _ url: URL,
        _ method: String,
        _ headers: [String: String]?,
        _ body: Encodable? = nil
    ) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        if let b = body {
            var httpBody: Data? {
                return try? JSONEncoder().encode(b)
            }
            urlRequest.httpBody = httpBody
        }
        
        return urlRequest
    }
    
    /**
        リクエストを送信してレスポンスを返却
     */
    static private func sendRequest(
        _ request: URLRequest
    ) async -> Result<Data, Error> {
        guard let (data, urlRequest) = try? await URLSession.shared.data(for: request) else {
            return .failure(iSKFetchError.couldNotCreateRequest)
        }
        guard let response = urlRequest as? HTTPURLResponse else {
            return .failure(iSKFetchError.responseNotReturned)
        }
        guard 200..<300 ~= response.statusCode else {
           return .failure(iSKFetchError.badStatusCode(response.statusCode))
        }
        
        return .success(data)
    }
}

public enum iSKFetchError: Error {
    case badURL
    case couldNotCreateRequest
    case responseNotReturned
    case badStatusCode(Int)
}

extension iSKFetchError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badURL:
            return "URLが不正です"
        case .couldNotCreateRequest:
            return "リクエストの作成に失敗しました"
        case .responseNotReturned:
            return "レスポンスがありませんでした"
        case .badStatusCode(let statusCode):
            return "通信ができませんでした statusCode: \(statusCode)"
        }
    }
}
