//
//  JsonConverter.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 01-05-22.
//

import Foundation

final class JsonConverter<T: Decodable> : NSObject {
    
    static func toJson(data: Any?) -> String {
        
        guard let jsonByte = data as? Data else { return "" }
        
        let jsonString = String(data: jsonByte, encoding: String.Encoding.utf8)
        
        return jsonString ?? ""
    }
    
    static func parseJson(data: Any) -> T? {
        
        do {
            let jsonString = toJson(data: data)
            let jsonData = Data(jsonString.utf8)
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: jsonData)
            return result
        } catch let error {
            print(error)
            return nil
        }
    }
    
        static func parsToJsonObject(data: Any) -> [String: Any]? {
            let jsonString = toJson(data: data)
            let jsonData = Data(jsonString.utf8)
    
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    return json
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                return nil
            }
            return nil
        }
    
    static func parsObjectToData(data: Any) -> Data?  {
        
        if let dataJson = try?  JSONSerialization.data(
            withJSONObject: data,
            options: .prettyPrinted
        ),
           let _ = String(data: dataJson,
                          encoding: String.Encoding.ascii) {
            return dataJson
        }
        return nil
    }
    

    
}
    
