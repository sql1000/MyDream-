//
//  SecilenMenuViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit

class SecilenMenuViewController: UIViewController {
    
    var sembollerListesi:[RuyaSembol] = [RuyaSembol]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let sembol1 = RuyaSembol(sembolResim: "at", sembolisim: "At", sembolAnlami: "Ozgurluk")
        let sembol2 = RuyaSembol(sembolResim: "ordek", sembolisim: "Ordek", sembolAnlami: "Sari")
        let sembol3 = RuyaSembol(sembolResim: "timsah", sembolisim: "Timash", sembolAnlami: "dinazor")
        let sembol4 = RuyaSembol(sembolResim: "kedi", sembolisim: "Kedi", sembolAnlami: "Tatlı olmas")
        sembollerListesi.append(sembol1)
        sembollerListesi.append(sembol2)
        sembollerListesi.append(sembol3)
        sembollerListesi.append(sembol4)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ruya" {
            let destination = segue.destination as! tabbarController
            let destination1 = destination.viewControllers![1] as! RuyaSembollColletionViewViewController
            if let veri = sender as? [RuyaSembol] {
                destination1.sembol = veri
            }
        }
    }
    
    
    @IBAction func ruyaYorumlamaButton(_ sender: Any) {
        performSegue(withIdentifier: "yorumlama", sender: nil)
    }
    
    @IBAction func ruyaSembolleriButton(_ sender: Any) {
        performSegue(withIdentifier: "ruya", sender: sembollerListesi)
    }
    
    
    @IBAction func profilButton(_ sender: Any) {
        performSegue(withIdentifier: "profil", sender: nil)
    }
    

}
