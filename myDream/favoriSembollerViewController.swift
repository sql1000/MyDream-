//
//  favoriSembollerViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 10.05.2023.
//

import UIKit

class favoriSembollerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
        
   
    @IBOutlet var tableView: UITableView!
    var favoriSemboller: [RuyaSembol] = []   // Favori sembollerinizi tutacak dizi

    
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        super.viewDidLoad()

    }
    // TableView Delegate ve DataSource metotları
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriSemboller.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriCell", for: indexPath)
        let sembol = favoriSemboller[indexPath.row]
        
        // Hücreyi güncelle
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData() // Tabloyu yeniden yükle
    }
 




  

}
