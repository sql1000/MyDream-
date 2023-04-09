//
//  ProfilimViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 3.04.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfilimViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profil Seçenekleri"
        //kopya lsdfdnnsndjng
        guard let userEmail = Auth.auth().currentUser?.email else {
                    // Kullanıcı giriş yapmamışsa ya da email adresi kayıtlı değilse nil döndür
                    return
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func exitButton(_ sender: Any) {
        print("Cikis yapiliyor")
        cikisAler(title: "Exit Alert", message: "Do you want to check out")
    }
    
    
    @IBAction func hesabiSil(_ sender: Any) {
        let user = Auth.auth().currentUser
         
         let alertController = UIAlertController(title: "Hesap Silme", message: "Hesabınızı silmek istediğinize emin misiniz?", preferredStyle: .alert)
         let evetAction = UIAlertAction(title: "Evet", style: .destructive) { (action) in
             user?.delete { error in
                 if let error = error {
                     print("Hesap silme hatası: \(error.localizedDescription)")
                     // Hesap silme hatası olduğunda kullanıcıya hata mesajını gösterebilirsiniz.
                     // Örneğin bir alert ile kullanıcıya hata mesajını göstermek için aşağıdaki kodu kullanabilirsiniz:
                     let errorAlertController = UIAlertController(title: "Hesap Silme Hatası", message: error.localizedDescription, preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                     errorAlertController.addAction(okAction)
                     self.present(errorAlertController, animated: true, completion: nil)
                 } else {
                     print("Hesap başarıyla silindi.")
                     exit(-1)
                     // Hesap başarıyla silindiyse gerekli işlemleri yapabilirsiniz, örneğin kullanıcıyı uygulamadan çıkartabilirsiniz.
                 }
             }
         }
        let hayirAction = UIAlertAction(title: "Hayır", style: .default) { UIAlertAction in
                //
        }
         alertController.addAction(evetAction)
         alertController.addAction(hayirAction)
         self.present(alertController, animated: true, completion: nil)
       
    }
    
    
    
    func cikisAler(title:String, message:String){
        let uyari = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let noButton = UIAlertAction(title: "No", style: .default)
        let cikisButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive) { UIAlertAction in
            do {
                try Auth.auth().signOut()
                UserDefaults.standard.removeObject(forKey: "rememberMe")
               // self.navigationController?.popViewController(animated: true)
                exit(-1)
            }catch let error {
                print("Error signing out: %@", error)
            }
        }
        

        uyari.addAction(noButton)
        uyari.addAction(cikisButton)
        
        self.present(uyari, animated: true)
    }
    
}

