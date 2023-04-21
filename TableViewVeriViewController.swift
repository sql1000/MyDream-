//
//  TableViewVeriViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 31.03.2023.
//

import UIKit
import CoreData


class TableViewVeriViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var sembolTableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var ruyaArray = [String]()
    var tarihArray = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sembolTableView.dataSource = self
        sembolTableView.delegate = self
        
        
        getData()
        
    }
    
     @objc func getData() {
        
        nameArray.removeAll(keepingCapacity: false)
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyDreams")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject] {
                if let tarih = result.value(forKey: "tarih") as? Date{
                    self.tarihArray.append(tarih)
                }
                if let basa = result.value(forKey: "ruya") as? String {
                    self.ruyaArray.append(basa)
                }
                if let id = result.value(forKey: "id") as? UUID {
                    self.idArray.append(id)
                }
                if let bas = result.value(forKey: "baslik") as? String {
                    self.nameArray.append(bas)
                }
                
                
                self.sembolTableView.reloadData()

            }
            
        } catch {
            print("hata")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "yeniData"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
        
    }
    
    
    

    
    @IBAction func ekleButton(_ sender: Any) {
        performSegue(withIdentifier: "ekle", sender: nil)
    }


}



