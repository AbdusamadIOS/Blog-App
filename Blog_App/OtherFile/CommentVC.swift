//
//  CommentVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 04/07/23.
//

import UIKit
import CoreData

class CommentVC: UIViewController {
    
    @IBOutlet weak var commnetsAreaTV: UITextView!
    
    var closure:(() -> Void)?
    var blog: Blog?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext
        commnetsAreaTV.layer.borderColor = UIColor.systemGray5.cgColor
        commnetsAreaTV.layer.borderWidth = 1
        
    }
    
    
    
    
    @IBAction func commentBtn(_ sender: UIButton) {
        
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            
            let userRequest = User.fetchRequest()
            let currentUserFilterPredicate = NSPredicate(format: "userName MATCHES %@", userName)
            userRequest.predicate = currentUserFilterPredicate
            if let user = try? context?.fetch(userRequest).first {
                
                print(user)
                
                let newComment = Comment(context: self.context!)
                newComment.message = commnetsAreaTV.text
                newComment.author = user
                newComment.blog = blog
                
                appDelegate.saveContext()
                
                dismiss(animated: true){
                    
                    if let closure = self.closure {
                        closure()
                    }
                }
            }
        }
    }
}
