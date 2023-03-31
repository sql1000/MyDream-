//
//  ViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var registerEmailTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextfield: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerButton(_ sender: Any) {
        //Firebase
    }
    
    
    @IBAction func HaveAccountButton(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: nil)
    }
    
}

