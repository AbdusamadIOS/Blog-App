//
//  ProfileTBVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit
import CoreData

class ProfileTBVC: UIViewController {

    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userLastNameLbl: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
 
    var userdata: UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        let navigationBarAppearance = UINavigationBarAppearance()
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold) ]
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .blue
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        context = appDelegate.persistentContainer.viewContext
        userImage.layer.cornerRadius = 42
        userImage.clipsToBounds = true
        setupTV()
        setupNav()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userdata {
            
            userNameLbl.text = userdata.surname
            userLastNameLbl.text = userdata.lastName
        }
    }

    func setupNav() {
        let out = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
                                   style: .done,
                                   target: self,
                                   action: #selector(OutBtn))
        
        navigationItem.rightBarButtonItem = out
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc func OutBtn(){
        
        UserDefaults.standard.set(false, forKey: "isLogin")
        let vc = MainVC(nibName: "MainVC", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    
    func setupTV() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    }
   
    @IBAction func logOutBtn(_ sender: UIButton) {
        
        let vc = MainVC(nibName: "MainVC", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    @IBAction func editProfile(_ sender: UIButton) {
        let vc2 = EditProVC(nibName: "EditProVC", bundle: nil)

        vc2.closure =  { userdata in
            self.userdata = userdata
        }
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
extension ProfileTBVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        86
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        let edit1 = ChangePassVC(nibName: "ChangePassVC", bundle: nil)
            
        self.navigationController?.pushViewController(edit1, animated: true)
        
    }
    
    
}
