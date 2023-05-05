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
            self.performSegue(withIdentifier: "splashGecildi", sender: nil)
        }
        
    }    

    
}
