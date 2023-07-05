//
//  CreateVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 13/06/23.
//

import UIKit

class CreateVC: UIViewController {
    
    @IBOutlet weak var topicTF: UITextField!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var postBtn: UIButton!
    
    var coreDataManager = CoreDataManager() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postBtn.layer.cornerRadius = 10
        contentTV.layer.cornerRadius = 15
        setupNav()
    }
    func setupNav() {
        title = "Post a Question"
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold) ]
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .blue
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }
    
    
    @IBAction func postBtn(_ sender: UIButton) {
        
        if topicTF.text != "" && contentTV.text != "" {
            
            coreDataManager.createBlog(topic: topicTF.text!, context: contentTV.text!)
            
            navigationController?.popViewController(animated: true)
        }
    }
}
