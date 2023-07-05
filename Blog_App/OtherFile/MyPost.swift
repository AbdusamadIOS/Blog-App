//
//  MyPost.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 04/07/23.
//

import UIKit
import CoreData

class MyPost: UIViewController {

    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    var blogs: [Blog] = []
    var blog: Blog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
        seeBlog()
    }
    func setupNav() {
        let pen = UIBarButtonItem(image: UIImage(systemName: "pencil"),
                                   style: .done,
                                   target: self,
                                   action: #selector(penBtn))
        
        navigationItem.rightBarButtonItem = pen
    }
    
    @objc func penBtn(){
        
        let vc = editPostVC(nibName: "editPostVC", bundle: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func seeBlog() {
        if let blog {
            
            topicLbl.text = blog.topic
            contentLbl.text = blog.content
        }
    }
    
}
