//
//  APIManager.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 03/01/21.
//

import Foundation

//APPError enum which shows all possible errors
enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result {
    case success(Data)
    case failure(APPError)
}

class APIManager {
    
    /**
     DataRequest which sends request to given URL and convert to Decodable Object.
     - parameters:
          - url: Url for data
          - completion: Callback to get final result
     */
    
    func dataRequest(with url: URL, completion: @escaping (Result) -> Void) {

        let dataURL = url
        let session = URLSession.shared
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            completion(Result.success(data))
        })

        task.resume()
    }
}
