//
//  LauchScreenViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 4.05.2023.
//

import UIKit

class LauchScreenViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.image = UIImage.gif(asset: "lunchscreen")
        
        
        

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4 ){ // giris ekrani 4 saniye sonra kapanacak
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Storyboard'ı oluşturun veya getirin
            let loginController = storyboard.instantiateViewController(withIdentifier: "LoginPageViewController") as! LoginPageViewController // LoginController'ı oluşturun veya getirin (storyboard ID'si kullanarak)
            self.navigationController?.pushViewController(loginController, animated: false) // Geçişi gerçekleştirin
        }
        
    }    

    
}
