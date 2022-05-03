//
//  SignUpViewController.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import UIKit

class SignUpViewController: BaseViewController {

    //MARK: -- Outlets
    @IBOutlet weak var mUsernameTxtFl: UITextField!
    @IBOutlet weak var mEmailTxtFl: UITextField!
    @IBOutlet weak var mPasswordTxtFl: UITextField!
    @IBOutlet weak var mConfirmPasswordTxtFl: UITextField!
    @IBOutlet weak var mErrorLb: UILabel!
    @IBOutlet weak var mSignUpBtn: UIButton!
    
    lazy var presenter = SignUpPresenter(delegate: self)

    //MARK: -- Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Methods

    func configureUI() {
        self.navigationController?.setNavigationBarBackground(color: Constant.Colors.main_color)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        mSignUpBtn.layer.cornerRadius = 3

    }

    //MARK: -- Actions
    @IBAction func signUp(_ sender: UIButton) {
        presenter.didTapSignUp(name: mUsernameTxtFl.text,
                               email: mEmailTxtFl.text,
                               password: mPasswordTxtFl.text,
                               confirmPassword: mConfirmPasswordTxtFl.text)
    }
    
}

//MARK: -- UITextField Delegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        mErrorLb.isHidden = true
        presenter.errMessage = nil
        return true

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

//MARK: -- SignUpPresenter Delegate
extension SignUpViewController: SignUpPresenterDelegate {
    
    ///Show sign up error message
    func showSignUpError(errMessage: String) {
        
        DispatchQueue.main.async { [unowned self] in
            self.mErrorLb.text = errMessage
            self.mErrorLb.isHidden = false
        }
    }
    
    //Display alert of registration
    func displayAlert(message: String) {
        self.showAlertMessage(meassage: message, actionText: Constant.Strings.login) {
            self.navigationController?.popViewController(animated: true)

        }
    }
    
    
}
