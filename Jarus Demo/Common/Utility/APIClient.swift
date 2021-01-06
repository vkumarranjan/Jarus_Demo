//
//  APIClient.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 03/01/21.
//

import Foundation

class ApiClient<T: Decodable> {
    
    // MARK: - Static Method
    
    static func makeRequest(url: URL, completion: @escaping (_ value: T?, _ error: CustomError?) -> Void) {
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let _ = error {
                    completion(nil, .serverError)
                } else {
                    guard let data = data, let response = try? JSONDecoder().decode(T.self, from: data) else {
                        completion(nil, .badResponse)
                        return
                    }
                    completion(response, nil)
                }
            }
        }
        task.resume()
    }
}
