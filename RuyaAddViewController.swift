//
//  RuyaAddViewController.swift
//  myDream
//
//  Created by Bahadır Sengun on 15.04.2023.
//

import UIKit
import CoreData


class RuyaAddViewController: UIViewController {
    
    @IBOutlet var ruyaTextView: UITextView!
    @IBOutlet var baslikTextField: UITextField!
    @IBOutlet var selecetDate: UITextField!
    var datePicer : UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rexognizers
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        datePicer = UIDatePicker()
        datePicer?.datePickerMode = .date
        selecetDate.inputView = datePicer
        
        datePicer?.addTarget(self, action: #selector(self.tarihGoster(datePicer:)), for: .valueChanged)
        
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(self.dokumaAlgilama))
        view.addGestureRecognizer(dokunmaAlgilama)
        
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
  
    
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let kaydedilenruya = NSEntityDescription.insertNewObject(forEntityName: "MyDreams", into: context)
        
        //Attributies
        
        kaydedilenruya.setValue(baslikTextField.text!, forKey: "baslik")
        kaydedilenruya.setValue(ruyaTextView.text!, forKey: "ruya")
        kaydedilenruya.setValue(selecetDate.text!, forKey: "tarih")

    
        if let year = Int(selecetDate.text!){
            kaydedilenruya.setValue(year, forKey: "tarih")
        }
        
        kaydedilenruya.setValue(UUID(), forKey: "id")
        
        
        do{
            try context.save()
            print("success")
        } catch{
            print("hata var")
        }
       
        NotificationCenter.default.post(name: NSNotification.Name("yeniData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @objc func tarihGoster(datePicer:UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let alinanTarih = dateFormatter.string(from: datePicer.date)
        print(alinanTarih)
        selecetDate.text = alinanTarih
        
        //view.endEditing(true)
    }
    
    
    @objc func dokumaAlgilama(){
        view.endEditing(true)
    }
    
    
    
}

