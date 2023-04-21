//
//  SembolAramaViewController.swift
//  
//
//  Created by Bahadır Sengun on 17.04.2023.
//

import UIKit

class SembolAramaViewController: UIViewController  {


    @IBOutlet var searchBar: UISearchBar!
    // Karsidan gonderdik
        var sembol = [RuyaSembol]() {
            didSet {
                print("Veri geldi")
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        searchBar.delegate = self
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    


}
extension SembolAramaViewController: UISearchBarDelegate{
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText != ""{
                let alert = UIAlertController(title: "Hata", message: "Sembol Anlamları Arama Çubuğu şuan çalışmıyor, Çok Yakında aktif olacak..", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Tamam", style: .cancel) { UIAlertAction in
                    self.hideKeyboard()
                }
                alert.addAction(ok)
                self.present(alert, animated: true)
            }
        }
    }
