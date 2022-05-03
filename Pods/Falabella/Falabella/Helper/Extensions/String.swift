//
//  Date.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 01-05-22.
//

import Foundation


extension String {
    
    ///Iso date formater
    func convertIsoDateFormater()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return  dateFormatter.string(from: date)
    }
}
