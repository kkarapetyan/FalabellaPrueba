//
//  AttributesPresenter.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import Foundation
import UIKit


protocol AttributesPresenterDelegate: AnyObject {
    func presentAttributes(valutas: [Valuta])
    func presentDetails(valuta: Valuta)
    func showLogin()
}

typealias PresenterDelagate = AttributesPresenterDelegate & UIViewController

class AttributesPresenter {
    
    weak var delegate: PresenterDelagate?
    var filteredData = [Valuta]()
    var valutas = [Valuta]()
    
    // MARK: - Initializer
    init(delegate: PresenterDelagate) {
        self.delegate = delegate
    }
    
    // MARK: -- Methods
    public func getAttributes() {

        NetworkManager.request(type: Data.self) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                guard let attributs = JsonConverter<[String:Attributes]>.parsToJsonObject(data: data as Any) else {
                    print("error")
                    return
                }
                
                if let result = attributs as? [String: Any] {
                    for item in result.values {
                        if let item = item as? [String: AnyObject] {
                            
                            guard let jsonData = JsonConverter<Data>.parsObjectToData(data: item as Any) else { return }
                            
                            guard let valuta = JsonConverter<Valuta>.parseJson(data: jsonData as Any) else { return }
                            self.valutas.append(valuta)
                            print("test = \(valuta)")
                        }
                    }
                }
               
                   self.delegate?.presentAttributes(valutas:self.valutas)
                
            case .failure(let err):
                if let err = err as? NetworkError {
                    switch err {
                    case .badRequest(let message):
                        print("ERROR: \(message)")
                    case .serverError:
                        print("Server Error!!")
                    }
                }
                
            }
        }
    }

    
    ///Get user name from user default
    func getUsernameTitle() -> String {
       let userName =  UserDefaults.standard.value(forKey: Constant.Keys.userName) as! String
        return String(format: Constant.Strings.helloUser, userName)
    }
    
    ///Logout tapped
    public func didTapLogout() {
        UserDefaultsManager.shared.clean()
        delegate?.showLogin()
        
    }
    
    ///  Did select row of table cell
    public func didTapTableCell(valuta: Valuta) {
        self.delegate?.presentDetails(valuta: valuta)
    }
    
    ///Filter attributes by code
    public func searchAttributes(searchTxt: String) {
        
        if (searchTxt == ""){
            filteredData = valutas
        } else{
            
            filteredData = []
            filteredData = valutas.filter{
                $0.codigo.lowercased().contains(searchTxt.lowercased())
            }
        }
        self.delegate?.presentAttributes(valutas: filteredData)
        
    }
    
    

}
