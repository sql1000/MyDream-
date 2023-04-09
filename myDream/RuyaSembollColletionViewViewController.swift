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

    @IBOutlet var collectionViewSembol: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Semboller"
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // Custom CollextionView tasarimi
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                let genislik = self.collectionViewSembol.frame.size.width
                tasarim.sectionInset = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 10)
                
                //Yatay da izahlama
                
                tasarim.itemSize = CGSize(width: (genislik / 3) - 20, height: (genislik / 3) - 20)
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
        return sembol.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexine daha kolay eriselim diye indexPath.row kullandik
        let sembol1 = sembol[indexPath.row]
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sembol", for: indexPath) as! SembolCollectionViewCell
        cell.sembolIsim.text = sembol1.sembolisim
        if let resim = sembol1.sembolResim{
            cell.sembolResim.image = UIImage(named: resim)
        }
        
        // Hucreye cerceve eklemek.
        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 8
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sembol1 = sembol[indexPath.row]
        let alert = UIAlertController(title: sembol1.sembolisim, message: sembol1.sembolAnlami!, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    
    
    
}


extension RuyaSembollColletionViewViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            let alert = UIAlertController(title: "Error", message: "Not Working, Coming soon", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel) { UIAlertAction in
                self.hideKeyboard()
            }
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
}
