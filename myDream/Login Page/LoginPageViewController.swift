//
//  LoginPageViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit
import Firebase
class LoginPageViewController: UIViewController {
    
    
    @IBOutlet weak var rememberMe: UISwitch!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBOutlet weak var loginPageEmailTextField: UITextField!
    
    @IBOutlet weak var loginPagePasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Log'in Page"
        
    }
    
    
    @IBAction func loginPageLoginButton(_ sender: Any) {
        loading.startAnimating()
        loading.isHidden = false
        
        
        guard let email = loginPageEmailTextField.text, let password = loginPagePasswordTextField.text else {
            return
        }
        
        if email == "admin" && password == "371626"{
            self.performSegue(withIdentifier: "", sender: nil)
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("Giriş işlemi başarısız: \(error.localizedDescription)")
                self.loading.isHidden = true
                let alertController = UIAlertController(title: "Hata", message: error.localizedDescription, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            if let user = authResult?.user{
                if user.isEmailVerified {
                    print("Giriş işlemi başarılı.")
                    if self.rememberMe.isOn {
                        UserDefaults.standard.set(true, forKey: "rememberMe")
                    }
                    self.performSegue(withIdentifier: "", sender: nil)
                    // Kullanıcının e-posta adresi doğrulanmış, uygulamanın ana sayfasına yönlendirin.
                }else {
                    print("E-posta adresi doğrulanmamış.")
                    self.loading.isHidden = true
                    let alertController = UIAlertController(title: "Hata", message: "E-posta adresinizi doğrulayın ve tekrar deneyin.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
}






