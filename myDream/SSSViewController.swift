//
//  SSSViewController.swift
//  myDream
//
//  Created by Bircan Sezgin on 5.05.2023.
//

import UIKit

class SSSViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var soruCevapArray = [SoruCevap]() {
        didSet {
            print("Veri geldi")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
            
    }
 
}


extension SSSViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soruCevapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comingQu = soruCevapArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ssTable") as! SSSTableViewCell
        cell.cevapLabel.text = comingQu.soruIsim
        cell.soruBasligiLabel.text = comingQu.soruCevap
        
        return cell
    }
    
    
}
