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
