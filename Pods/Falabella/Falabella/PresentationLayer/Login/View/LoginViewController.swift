//
//  LoginViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit

class LoginViewController: BaseViewController {

    // MARK: -- Outlet
    @IBOutlet weak var mEmailTxtFl: UITextField!
    @IBOutlet weak var mPasswordTxtFl: UITextField!
    @IBOutlet weak var mErrLb: UILabel!
    @IBOutlet weak var mLoginBtn: UIButton!
    @IBOutlet weak var mSignUpBtn: UIButton!
    
    lazy var presenter = LoginPresenter(delegate: self)

    
    // MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mLoginBtn.layer.cornerRadius = 3
        configureDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        mEmailTxtFl.text = nil
        mPasswordTxtFl.text = nil
    }
    
    //MARK: -- Methods

    private func configureDelegate() {
        mEmailTxtFl.delegate = self
        mPasswordTxtFl.delegate = self
    }


    // MARK: -- Actions
    @IBAction func login(_ sender: UIButton) {
        presenter.didTapLogin(email: mEmailTxtFl.text, password: mPasswordTxtFl.text)
    }
    
    @IBAction func signUP(_ sender: UIButton) {
        presenter.didTapSignUp()
     }
       
}

//MARK: -- UITextField Delegate
extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        mErrLb.isHidden = true
        return true

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mEmailTxtFl {
            mPasswordTxtFl.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: -- LoginPresenter Delegate
extension LoginViewController: LoginPresenterDelegate {
   
    
   /// Show registration screen
    func showSignUp() {
        
        let vc = SignUpViewController(nibName: Constant.NibNames.signUp, bundle: getBundle(myClass: SignUpViewController.self))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    ///Show error of login fileds
    func showLoginError(errMessage: String) {
        DispatchQueue.main.async { [unowned self] in
            self.mErrLb.text = errMessage
            self.mErrLb.isHidden = false
        }
    }
    
    /// Show attributes  screen
    func showAttributes() {
        
        let vc = AttributesViewController(nibName: Constant.NibNames.attributes, bundle: getBundle(myClass: AttributesViewController.self))
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
