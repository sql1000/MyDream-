//
//  RuyaSembollColletionViewViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 3.04.2023.
//

import UIKit

class RuyaSembollColletionViewViewController: UIViewController {
    
    var sembol = [RuyaSembol]() {
        didSet {
            
        }
    }

    @IBOutlet var collectionViewSembol: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasarim: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                let genislik = self.collectionViewSembol.frame.size.width
                tasarim.sectionInset = UIEdgeInsets(top: 7, left: 10, bottom: 7, right: 10)
                
                //Yatay da
                
                tasarim.itemSize = CGSize(width: (genislik / 3) - 20, height: (genislik / 3) - 20)
                tasarim.minimumInteritemSpacing = 5
                tasarim.minimumLineSpacing = 5
                
        collectionViewSembol!.collectionViewLayout = tasarim

        collectionViewSembol.delegate = self
        collectionViewSembol.dataSource = self
        
        
        
    }
    


}


extension RuyaSembollColletionViewViewController: UICollectionViewDelegate, UICollectionViewDataSource{

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sembol.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sembol1 = sembol[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sembol", for: indexPath) as! SembolCollectionViewCell
        cell.sembolIsim.text = sembol1.sembolisim
        if let resim = sembol1.sembolResim{
            cell.sembolResim.image = UIImage(named: resim)
        }
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
