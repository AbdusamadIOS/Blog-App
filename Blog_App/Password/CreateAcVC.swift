//
//  CreateAcVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit
import CoreData

class CreateAcVC: UIViewController {

    @IBOutlet weak var singUpBtn: UIButton!
    @IBOutlet weak var singInBtn: UIButton!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = appDelegate.persistentContainer.viewContext
        
        singUpBtn.layer.cornerRadius = 15
        singInBtn.layer.cornerRadius = 15
        
    }


    @IBAction func singInBtn(_ sender: UIButton) {
        
        let vc = SingInVC(nibName: "SingInVC", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    @IBAction func singUpBtn(_ sender: UIButton) {
        
        if (firstNameTF.text != "") && (lastNameTF.text != "") && (usernameTF.text != "") && (passwordTF.text != "") {
            let newUser = User(context: self.context!)
            
            newUser.firstName = firstNameTF.text!
            newUser.lastName = lastNameTF.text!
            newUser.userName = usernameTF.text!
            newUser.password = passwordTF.text!
            
            print(newUser)
            appDelegate.saveContext()
            
            UserDefaults.standard.set(true, forKey: "isLogin")
            UserDefaults.standard.set(newUser.userName, forKey: "userName")
            
            let vc = Tabbar(nibName: "Tabbar", bundle: nil)
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
        }
        
    }
    
}
