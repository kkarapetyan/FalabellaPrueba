//
//  Constants.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 28-04-22.
//

import UIKit


struct Constant {
    
    
    struct NibNames {
        
        static let login = "LoginViewController"
        static let details = "DetailsViewController"
        static let signUp = "SignUpViewController"
        static let attributes = "AttributesViewController"

    }
    
    
    struct Strings {
        
        static let fillFileds = "¡Por favor rellena todos los campos!"
        static let invalidEmail = "¡E-mail incorrecto!"
        static let confirmPass = "¡Las contraseñas deben ser iguales!"
        static let accountExist = "¡La cuenta ya existe!"
        static let failedSignup = "¡Registro fallido!"
        static let registerSccessful = "¡Registro completo!"
        static let invalidLogin = "¡E-mail o contraseña incorrectos!"
        static let helloUser = "Hola %@"
        static let login = "Ingresar"
        static let logout = "Salir"
    }
    
    struct Keys {
        static let email = "Email"
        static let password = "Password"
        static let userName = "UserName"

    }
    
    struct Colors {
        
        static let main_color = UIColor(red: 50/255.0, green: 65/255.0, blue: 185/255.0, alpha: 1)

    }
}

