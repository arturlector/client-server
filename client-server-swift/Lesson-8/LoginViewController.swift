//
//  LoginViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 14.06.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var token: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            
            guard user != nil else { return }
            self?.showMainScreen()
        }

    }
    
    //MARK: - Private
    
    private func showAlert(title: String?, text: String?) {
        
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okControl = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okControl)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showMainScreen() {
        guard let vc = storyboard?.instantiateViewController(identifier: "Main"),
              let window = self.view.window else { return }
        window.rootViewController = vc
    }
    
    //MARK: - Actions
    
    @IBAction func authorizationAction(_ sender: Any?) {
        
        guard let email = loginTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        
        else {
            showAlert(title: "Ошибка ввода логина или пароля", text: "Не введено")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
            } else {
                self?.showMainScreen()
            }
        }
    }
    
    
    @IBAction func registrationAction(_ sender: Any) {
        
        guard let email = loginTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        
        else {
            showAlert(title: "Ошибка ввода логина или пароля", text: "Не введено")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]  authResult, error in
            
            if let error = error {
                self?.showAlert(title: "Ошибка Firebase", text: error.localizedDescription)
            } else {
                self?.authorizationAction(nil)
            }
        }
        
    }
    
}
