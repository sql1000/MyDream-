//
//  ViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var registerEmailTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextfield: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: Any) {
        guard let email = registerEmailTextField.text, let password = registerPasswordTextfield.text else {
               return
           }
           
           Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
               if let error = error {
                   print("Kayıt işlemi başarısız: \(error.localizedDescription)")
                   
                   let alertController = UIAlertController(title: "Hata", message: error.localizedDescription, preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                   alertController.addAction(okAction)
                   self.present(alertController, animated: true, completion: nil)
                   
                   return
               }
               
               // E-posta doğrulama postasını gönder
               authResult?.user.sendEmailVerification(completion: { (error) in
                   if let error = error {
                       print("E-posta doğrulama postası gönderilemedi: \(error.localizedDescription)")
                       return
                   }
                   
                   print("E-posta doğrulama postası başarıyla gönderildi.")
               })
               
               print("Kayıt işlemi başarılı.")
               
               let alertController = UIAlertController(title: "Başarılı", message: "Başarıyla kayıt oldunuz. E-posta adresinize doğrulama postası gönderildi.", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "Tamam", style: .default) { (action) in
                   self.loading.isHidden = true
               }
               alertController.addAction(okAction)
               self.present(alertController, animated: true, completion: nil)
           }
       }
           
    
    
    @IBAction func HaveAccountButton(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: nil)
    }
    
}

