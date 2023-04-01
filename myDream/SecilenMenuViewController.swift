//
//  SecilenMenuViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit

class SecilenMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func ruyaSembolleriButton(_ sender: Any) {
        performSegue(withIdentifier: "semboller", sender: nil)
    }
    
    
    

}
