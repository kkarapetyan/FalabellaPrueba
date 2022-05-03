//
//  LoginPresenter.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import UIKit
import Alamofire


protocol LoginPresenterDelegate: AnyObject {
    func showSignUp()
    func showLoginError(errMessage: String)
    func showAttributes()
}


class LoginPresenter {
    lazy var validator = Validator()
    weak var delegate: LoginPresenterDelegate?
    
    // MARK: - Initializers
    init(delegate: LoginPresenterDelegate) {
        self.delegate = delegate
    }
    
    ///Did tap sign up button
    public func didTapSignUp() {
        //display sign up view
        delegate?.showSignUp()
    }
    
    ///Did tap login  button
    public func didTapLogin(email: String?, password: String?) {
        if !validator.isLoginFilled(name: email, email: password) {
            
            delegate?.showLoginError(errMessage: Constant.Strings.fillFileds)
            
        } else  {
            
            let pass = try! password!.aesEncrypt()
            guard let result = CoreDataManager.shared?.fetchUserdetails(withEmail: email!,
                                                                      password: pass ) else {
               delegate?.showLoginError(errMessage: Constant.Strings.invalidLogin)
               return
           }
            
            saveToUserDefault(user: result)
            delegate?.showAttributes()
            
        }
    }
    
    ///Save user information to userDefault
    private func saveToUserDefault(user: Userdetails) {
        
        UserDefaultsManager.shared.store(user.email, key: Constant.Keys.email)
        UserDefaultsManager.shared.store(user.password, key: Constant.Keys.password)
        UserDefaultsManager.shared.store(user.name, key: Constant.Keys.userName)


    }
}
