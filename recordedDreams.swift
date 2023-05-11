//
//  recordedDreams.swift
//  myDream
//
//  Created by Bahadır Sengun on 19.04.2023.
//

import UIKit
import CoreData

class recordedDreams: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // HATA GELİNCE FİXLEDİM
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }*/
    
    
    
    @IBOutlet var tableView: UITableView!
    
    var baslikArray = [String]()
    var ruyaArray = [String]()
    var idArray = [UUID]()
    
    
    var selectedDreams = ""
    var selectedDreamsId : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        // tableView arka planı değiştirme
        // self.tableView.backgroundColor = UIColor.systemBlue

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =   UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData()
        
    }
    // tableView renk ayaraları
   /* func tableView(_ tableView: UITableView, cellforRowt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = baslikArray[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemBlue
        cell.selectedBackgroundView = backgroundView
        return cell
    } */
    // TableView Satır tıklayınca arka plan değişir.
    /* extension UITableView{
        func addBackground(imageName:String) {
            
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
           
            let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
            imageViewBackground.image = UIImage(named: imageName)
           
            
            imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
           
            self.addSubview(imageViewBackground)
            self.sendSubviewToBack(imageViewBackground)
        }
    } */
    
   
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
        
    
    @objc func getData() {
        ruyaArray.removeAll(keepingCapacity: false)
        baslikArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
       

        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dreams")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let baslik = result.value(forKey: "baslik") as? String{
                        self.baslikArray.append(baslik)
                    }
                    
                    if let ruya = result.value(forKey: "ruya") as? String{
                        self.ruyaArray.append(ruya)
                    }
                    
                    
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.append(id)
                    }
                    self.tableView.reloadData()
                    
                }
            }
            
            
        } catch {
            print("Error")
        }
        
        
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baslikArray.count
    }
    ///
    func ruyaTextView(_ ruyaTextView: UITextView, numberOfRowsInSection section: Int) -> Int {
        return ruyaArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = baslikArray[indexPath.row]
        return cell
    }
    
    @objc func addButtonClicked(){
        selectedDreams = ""
    performSegue(withIdentifier: "dreamSave", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dreamSave" {
            let destinationVC = segue.destination as! dreamSave
            destinationVC.chosenDreams = selectedDreams
            destinationVC.chosenDreamsId = selectedDreamsId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDreams = baslikArray[indexPath.row]
        /*selectedDreams = ruyaArray[indexPath.row]*/
        selectedDreamsId = idArray[indexPath.row]
        performSegue(withIdentifier: "dreamSave", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dreams")
            let idString = idArray[indexPath.row].uuidString
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
            let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let id = result.value(forKey: "id") as? UUID {
                            
                            if id == idArray[indexPath.row]{
                                
                                context.delete(result)
                                baslikArray.remove(at: indexPath.row)
                                /*ruyaArray.remove(at: indexPath.row)*/
                                idArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                do {
                                    try context.save()
                                } catch{
                                    print("error")
                                }
                                break
                            }
                        }
                    }
                }
            } catch {
                print("hata")
            }
        }
    }
 }


