//
//  SembolAramaViewController.swift
//  
//
//  Created by Bahadır Sengun on 17.04.2023.
//

import UIKit

class SembolAramaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    //favorisemboller
    //var favoriSemboller: [RuyaSembol] = []

    
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
        
        tableView.sectionIndexMinimumDisplayRowCount = 20

        
        
    }
    //favorisemboller çekilecek özellikleri
    struct FavoriSembol {
        let sembolisim: String
        let sembolAnlami: String
        // Diğer gerekli özellikler...
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



    
    /*func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A", "B", "C", "Ç", "D", "E", "F", "G", "Ğ", "H", "I", "İ", "J",
                "K", "L", "M", "N", "O", "Ö", "P", "Q", "R", "S", "Ş", "T", "U",
                "Ü", "V", "W", "X", "Y", "Z"]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    //kaydırınca favorilere ekle
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorilere Ekle") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            
            let selectedSembol = self.sembol[indexPath.row]
            self.favoriSemboller.append(selectedSembol)
            
            
            
            completionHandler(true) // İşlemin tamamlandığını bildirin
        }
        favoriteAction.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    } */


    
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
    
    // Hücreye tiklaninca ne olsun
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var gelenveri: RuyaSembol
        if aramaYapiliyorMu {
            let sembolAdi = aramaSonucuSembol[indexPath.row]
            gelenveri = sembol.first(where: { $0.sembolisim == sembolAdi })!
        } else {
            gelenveri = sembol[indexPath.row]
        }
        
        let alert = UIAlertController(title: gelenveri.sembolisim!, message: gelenveri.sembolAnlami!, preferredStyle: .alert)
        let button = UIAlertAction(title: "Tamam", style: .default)

        
        alert.addAction(button)

        
        self.present(alert, animated: true)
    }
    // rehber
    
    // favori semboller sağ üst button
    /*@IBAction func favoriSembollerButton(_ sender: Any) {
        let alert = UIAlertController(title: "Favori Semboller Çok Yakında", message: "", preferredStyle: .alert)
            let button = UIAlertAction(title: "Tamam", style: .default)
            alert.addAction(button)

        
        
        //self.performSegue(withIdentifier: "favoriler", sender: nil)
        }*/
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriler" {
            let destinationVC = segue.destination as! favoriSembollerViewController
            destinationVC.favoriSemboller = favoriSemboller
        }
    }*/



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



