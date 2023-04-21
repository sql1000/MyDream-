//
//  dreamSave.swift
//  myDream
//
//  Created by Bahadır Sengun on 19.04.2023.
//

import UIKit
import CoreData

class dreamSave: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var baslıkText: UITextField!
    
    @IBOutlet var tarihText: UITextField!
    
    @IBOutlet var duyguText: UITextField!
    var datePicer : UIDatePicker?

    
    var chosenDreams = ""
    var chosenDreamsId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicer = UIDatePicker()
        datePicer?.datePickerMode = .date
        tarihText.inputView = datePicer
        
        datePicer?.addTarget(self, action: #selector(self.tarihGoster(datePicer:)), for: .valueChanged)
        
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokumaAlgilama))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        if chosenDreams != "" {
            //coredata
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Dreams")
            let idString = chosenDreamsId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let baslık = result.value(forKey: "baslik") as? String {
                            baslıkText.text = baslık
                        }
                        
                        if let duygu = result.value(forKey: "duygu") as? String {
                            duyguText.text = duygu
                        }
                        
                        if let tarih = result.value(forKey: "tarih") as? Int {
                            tarihText.text = String(tarih)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
                
 
            } catch {
                print("Error")
                
            }
            
            
            
        } else{
            
        }
        
        
        //RECOGNİZERS
        
        //Klavye Gizleme
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectimage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem =   UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))

        
    }
    // Klavye Gizleme
    @objc func hideKeyboard(){
        view.endEditing(false)
    }
    
    @objc func addButtonClicked(){
        performSegue(withIdentifier: "recordedDreams", sender: nil)
    }
    
    @objc func selectimage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
        
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }

    
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newDream = NSEntityDescription.insertNewObject(forEntityName: "Dreams", into: context)
        
        // Attributes
        
        newDream.setValue(duyguText.text!, forKey: "duygu")
        newDream.setValue(baslıkText.text!, forKey: "baslik")
        
        if let tarih = Int(tarihText.text!){
            newDream.setValue(tarih, forKey: "tarih")
        }
        
        newDream.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        newDream.setValue(data, forKey: "image")
        
        
        do {
            try context.save()
            print("Success")
        }catch{
            print("Hata Var")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    @objc func tarihGoster(datePicer:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let alinanTarih = dateFormatter.string(from: datePicer.date)
        print(alinanTarih)
        tarihText.text = alinanTarih
        
        //view.endEditing(true)
    }
    
    
    @objc func dokumaAlgilama(){
        view.endEditing(true)
    }
    
    
    
    

}
