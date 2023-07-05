//
//  SingInVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit
import CoreData

class SingInVC: UIViewController {
    
    @IBOutlet weak var crateBtn: UIButton!
    @IBOutlet weak var singInBtn: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext
        
        singInBtn.layer.cornerRadius = 15
        crateBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func createBtn(_ sender: UIButton) {
        
        let vc1 = CreateAcVC(nibName: "CreateAcVC", bundle: nil)
        
        vc1.modalTransitionStyle = .coverVertical
        vc1.modalPresentationStyle = .fullScreen
        
        self.present(vc1, animated: true)
        
    }
    
    @IBAction func singInBtn(_ sender: UIButton) {
        
        if (userNameTF.text != "") && (passwordTF.text != "" ) {
            
            let request: NSFetchRequest<User> = User.fetchRequest()
            
            let predicate = NSPredicate(format: "userName MATCHES %@", userNameTF.text!)
            request.predicate = predicate
            
            if let user = try? context?.fetch(request).first {
                
               
                    if user.password == passwordTF.text {
                        
                        UserDefaults.standard.set(true, forKey: "isLogin")
                        UserDefaults.standard.set(user.userName, forKey: "userName")
                        
                        let vc = Tabbar(nibName: "Tabbar", bundle: nil)
                        
                        vc.modalTransitionStyle = .coverVertical
                        vc.modalPresentationStyle = .fullScreen
                        
                        self.present(vc, animated: true)
                        return
                    }
                    print("parol xato")
                } else {
                    print("userName xato")
                }
            }
        }
        
    }

