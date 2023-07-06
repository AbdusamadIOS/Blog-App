//
//  SeePostVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 04/07/23.
//

import UIKit

class SeePostVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var tableViewBalandlik: NSLayoutConstraint!
    @IBOutlet weak var commentBtn: UIButton!
    
    var coreDataManager = CoreDataManager()
    var blog: Blog?
    var comments: [Comment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        seeBlog()
        comments = coreDataManager.getComments(of: blog!)
        setupTableview()
        commentBtn.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getData()
    }
    func getData() {
        
        comments = coreDataManager.getComments(of: blog!)
        tableView.reloadData()
        
        if comments.count == 0 {
            tableViewBalandlik.constant = 0
        }else {
            tableViewBalandlik.constant = 450
        }
    }
    
    func setupTableview() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
    }
    

    func seeBlog(){
        
        if let blog {
            
            topicLbl.text = blog.topic
            contentLbl.text = blog.content
        }
    }
   
    @IBAction func commentBtn(_ sender: UIButton) {
        
        let vc = CommentVC(nibName: "CommentVC", bundle: nil)
        
        if let bottomSheet =  vc.sheetPresentationController {
            
            bottomSheet.detents = [.medium(), .large()]
            
            
        }
        
        vc.closure = { 
            
            self.getData()
        }
        vc.blog = blog
        
        
        
        self.present(vc, animated: true)
       
    }
    
   
    
   
    
}
extension SeePostVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        
        cell.commentLbl.text = comments[indexPath.row].message
        cell.userNameLbl.text = comments[indexPath.row].author?.userName
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
