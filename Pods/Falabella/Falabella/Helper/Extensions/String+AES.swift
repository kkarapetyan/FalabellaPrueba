//
//  String+AES.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 30-04-22.
//

import UIKit
import CryptoSwift


extension String {   
    
    func aesEncrypt() throws -> String {

        let key = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw" // length == 32
        let iv = "gqLOHUioQ0QjhuvI" // length == 16
        let encrypted = try AES(key: key, iv: iv, padding: .pkcs7).encrypt([UInt8](self.data(using: .utf8)!))
        return Data(encrypted).base64EncodedString()
    }

    func aesDecrypt() throws -> String {
        let key = "bbC2H19lkVbQDfakxcrtNMQdd0FloLyw" // length == 32
        let iv = "gqLOHUioQ0QjhuvI" // length == 16
        guard let data = Data(base64Encoded: self) else { return "" }
        let decrypted = try AES(key: key, iv: iv, padding: .pkcs7).decrypt([UInt8](data))
        return String(bytes: decrypted, encoding: .utf8) ?? self
    }
    
    

}


