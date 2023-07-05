//
//  HomeTabBarVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit

class HomeTabBarVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createBtn: UIButton!
   
    var coreDataManager = CoreDataManager()
    var blogs: [Blog] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold) ]
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .blue
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
       
        createBtn.layer.cornerRadius = 10
       
        setupTV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        blogs = coreDataManager.getBlogs()
        tableView.reloadData()
    }
    
    func setupTV() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
    
    @IBAction func createBtn(_ sender: UIButton) {
        
        let vc = CreateVC(nibName: "CreateVC", bundle: nil)
        
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeTabBarVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
       
        cell.blogMavzusiLbl.text = blogs[indexPath.row].topic
        cell.blogTarifLbl.text = blogs[indexPath.row].content
        
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        181
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = SeePostVC(nibName: "SeePostVC", bundle: nil)
       
        vc.blog = blogs[indexPath.row]
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//
//        let deleteAction = UIContextualAction(style: .normal, title: "O'chirish") { [self]_,_,_ in
//
//            blogs.remove(at: indexPath.row)
//            context?.delete(blogs[indexPath.row])
//            appDelegate.saveContext()
//            tableView.reloadData()
//        }
//
//        deleteAction.backgroundColor = UIColor.red
//
//
//
//        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
//
//        return swipe
//
//    }
    
}
