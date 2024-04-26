//
//  APIManager.swift
//  AssessmentTask

import Foundation

// MARK: - APIManager
class APIManager {
    
    enum APIError: Error {
        case invalidURL
        case invalidResponse
        case requestFailed
        case invalidData
    }
    
    static let shared = APIManager()
    private init() {}
    
    func APIReqeust(requestType:String,url: URL, parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = requestType
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                completion(.failure(error ?? APIError.requestFailed))
                return
            }
            guard response.statusCode == 200 else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            completion(.success(data))
        }
        
        task.resume()
    }
}
