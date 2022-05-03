//
//  DetailsPresenter.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation
import UIKit


protocol DetailsPresenterDelegate: AnyObject {
    func presentDetails(valuta: Valuta)
}


class DetailsPresenter {
    weak var delegate: DetailsPresenterDelegate?
    
    // MARK: - Initializer
    init(delegate: DetailsPresenterDelegate) {
            self.delegate = delegate
        }
    
    public func receiveDetails(valuta: Valuta) {
        self.delegate?.presentDetails(valuta: valuta)
        
    }
}
