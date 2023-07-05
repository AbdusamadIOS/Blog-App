//
//  LikeTabBarVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit

class LikeTabBarVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var coreDataManager = CoreDataManager()
    var blogs: [Blog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My blog"
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold) ]
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .blue
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        setupTV()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        blogs = coreDataManager.getBlogs(ofUser: true)
        tableView.reloadData()
    }
   
    func setupTV() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LikeCell", bundle: nil), forCellReuseIdentifier: "LikeCell")
    }
    

}

extension LikeTabBarVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell") as! LikeCell
        
        cell.blogMavzusiLbl.text = blogs[indexPath.row].topic
        cell.blogTarifiLbl.text = blogs[indexPath.row].content
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc1 = MyPost(nibName: "MyPost", bundle: nil)
        vc1.blog = blogs[indexPath.row]
        
        self.navigationController?.pushViewController(vc1, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        181
    }
    
    
    
}
