//
//  SembolAramaViewController.swift
//  
//
//  Created by Bahadır Sengun on 17.04.2023.
//

import UIKit

class SembolAramaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    // Karsidan gonderdik
    var sembol = [RuyaSembol]() {
        didSet {
            print("Veri geldi")
        }
    }
    
    var aramaSonucuSembol:[String] = [String]()
    var aramaYapiliyorMu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
       
        
    }
    @objc func hideKeyboard(){
        view.endEditing(false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if aramaYapiliyorMu == true{
            return aramaSonucuSembol.count
        }else{
            return sembol.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gelenveri = sembol[indexPath.row]
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        
        
        if aramaYapiliyorMu {
            content.text = aramaSonucuSembol[indexPath.row]
        }else{
            content.text = gelenveri.sembolisim
        }
        cell.contentConfiguration = content
        return cell
        
    }
    
    // H]cre tiklaninca ne olsun
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var gelenveri: RuyaSembol
        if aramaYapiliyorMu {
            let sembolAdi = aramaSonucuSembol[indexPath.row]
            gelenveri = sembol.first(where: { $0.sembolisim == sembolAdi })!
        } else {
            gelenveri = sembol[indexPath.row]
        }
        
        let alert = UIAlertController(title: gelenveri.sembolisim!, message: gelenveri.sembolAnlami!, preferredStyle: .alert)
        let button = UIAlertAction(title: "okey", style: .default)
        
        alert.addAction(button)
        
        self.present(alert, animated: true)
    }

    
    
}
extension SembolAramaViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu \(searchText)")
        
        if searchText == "" { // Arama yapilmiyor
            aramaYapiliyorMu = false
        } else {
            aramaYapiliyorMu = true
            
            let filteredSembol = sembol.filter { $0.sembolisim!.lowercased().contains(searchText.lowercased()) }
            aramaSonucuSembol = filteredSembol.map { $0.sembolisim! }
        }
        
        tableView.reloadData()
    }
}



