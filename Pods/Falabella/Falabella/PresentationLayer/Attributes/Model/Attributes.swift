//
//  Attributes.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation


struct Attributes: Decodable {
   
}

struct Valuta: Decodable {
    let codigo : String
    let nombre : String
    let unidad_medida : String
    let fecha : String
    let valor : Double
}
