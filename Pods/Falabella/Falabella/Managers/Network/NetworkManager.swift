//
//  NetworkManager.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case badRequest(message: String)
    case serverError
}

let Data_URL = "https://www.mindicador.cl/api"


class NetworkManager: NSObject {
    
    
    static func request<T: Decodable>(type: T.Type, completion: @escaping (_ result: Result<T?, NetworkError>) -> Void) {
        AF.request(Data_URL).response { (result) in
            
                        guard (200 ... 299) ~= result.response?.statusCode ?? 0 else {
                            if (400...499).contains(result.response?.statusCode ?? 0) {
                                completion(.failure(.badRequest(message: result.error?.localizedDescription ?? "Bad Request")))
                            } else {
                                completion(.failure(.serverError))
                            }
                            return
                        }
            completion(.success(result.data as? T))
                    }
            
        }
        

}
