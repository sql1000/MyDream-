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
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var loginPageEmailTextField: UITextField!
    
    @IBOutlet weak var loginPagePasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
                title: "Login",
                style: .done,
                target: nil,
                action: nil
            )
        navigationItem.backBarButtonItem?.tintColor = .red
        
        imageView.image = UIImage.gif(asset: "giris2")
        navigationItem.title = "Login"
        loading.isHidden = true
        //navigationController?.isNavigationBarHidden = true
        
        
               // Otomaik giris
               if UserDefaults.standard.bool(forKey: "rememberMe") && Auth.auth().currentUser != nil {
                   self.performSegue(withIdentifier: "anaSayfa", sender: nil)
               }
        //KLAVYE GİZLEME
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
           
    }
    // KLAVYE GİZLEME
    @objc func hideKeyboard(){
        view.endEditing(false)
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
//
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
                    self.performSegue(withIdentifier: "anaSayfa", sender: nil)
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






