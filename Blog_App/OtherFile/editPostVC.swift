//
//  editPostVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 14/06/23.
//

import UIKit
import CoreData

class editPostVC: UIViewController {

    @IBOutlet weak var topicTF: UITextField!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    var blog: Blog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        context = appDelegate.persistentContainer.viewContext
        saveBtn.layer.cornerRadius = 10
        editBlog()
    }
    func editBlog() {
        if let blog {
            
            topicTF.text = blog.topic
            contentTV.text = blog.content
            
        }
    }

    @IBAction func disBtn(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    @IBAction func saveBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
