//
//  TableViewVeriViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit

class TableViewVeriViewController: UIViewController {

    
    
    
    @IBOutlet weak var sembolTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sembolTableView.dataSource = self
        sembolTableView.delegate = self
        
        
    }
    
    
    
    @IBAction func ekleButton(_ sender: Any) {
        performSegue(withIdentifier: "ekle", sender: nil)
    }
    
    

}



extension TableViewVeriViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
        
        
    }
    
    
}
