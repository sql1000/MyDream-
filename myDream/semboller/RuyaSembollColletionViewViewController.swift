//
//  RuyaSembollColletionViewViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 3.04.2023.
//

import UIKit

class RuyaSembollColletionViewViewController: UIViewController {
    
    @IBOutlet var searcBar: UISearchBar!
// Karsidan gonderdik
    var sembol = [RuyaSembol]() {
        didSet {
            print("Veri geldi")
        }
    }
    var aramaSonucuSembol:[String] = [String]()
    var aramaYapiliyorMu = false
    @IBOutlet var collectionViewSembol: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Semboller"
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground // arka plan rengi
        
        
        /*
         let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

                 let genislik = self.view.frame.size.width

                 tasarim.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

                 

                 //Yatay da

                 

                 tasarim.itemSize = CGSize(width: (genislik - 30) / 3 , height: (genislik - 30) / 3)

                 tasarim.minimumInteritemSpacing = 5

                 tasarim.minimumLineSpacing = 5

                 

                 collectionView!.collectionViewLayout = tasarim
         */


        
        // Custom CollextionView tasarimi
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                let genislik = self.collectionViewSembol.frame.size.width
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
                
                //Yatay da izahlama
                
                tasarim.itemSize = CGSize(width: (genislik - 30) / 3 , height: (genislik - 30) / 3)
                tasarim.minimumInteritemSpacing = 5
                tasarim.minimumLineSpacing = 5
                
        collectionViewSembol!.collectionViewLayout = tasarim

        collectionViewSembol.delegate = self
        collectionViewSembol.dataSource = self
        searcBar.delegate = self
        
        
    }
        // klavye kapatma komudu
    @objc func hideKeyboard(){
        view.endEditing(true)
    }

}



extension RuyaSembollColletionViewViewController: UICollectionViewDelegate, UICollectionViewDataSource{

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Sembol arrayinin uzunlugunu aldik. Geri gonderdi
        
        
        if aramaYapiliyorMu == true{
            return aramaSonucuSembol.count
        }else{
            return sembol.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexine daha kolay eriselim diye indexPath.row kullandik
        let sembol1 = sembol[indexPath.row]
        let gelenveri = sembol[indexPath.row]

        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sembol", for: indexPath) as! SembolCollectionViewCell
        cell.sembolIsim.text = sembol1.sembolisim
        if let resim = sembol1.sembolResim{
            cell.sembolResim.image = UIImage(named: resim)
        }
        
        // Hucreye cerceve eklemek.
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        
        if aramaYapiliyorMu {
            cell.sembolIsim.text = aramaSonucuSembol[indexPath.row]
        }else{
            cell.sembolIsim.text = gelenveri.sembolisim
        }
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
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


extension RuyaSembollColletionViewViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu \(searchText)")
        
        if searchText == "" { // Arama yapilmiyor
            aramaYapiliyorMu = false
        } else {
            aramaYapiliyorMu = true
            
            let filteredSembol = sembol.filter { $0.sembolisim!.lowercased().contains(searchText.lowercased()) }
            aramaSonucuSembol = filteredSembol.map { $0.sembolisim! }
        }
        
        collectionViewSembol.reloadData()
    }
}
