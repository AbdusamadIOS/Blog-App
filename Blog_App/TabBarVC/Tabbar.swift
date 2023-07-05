//
//  Tabbar.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let home = HomeTabBarVC(nibName: "HomeTabBarVC", bundle: nil)
        
        home.tabBarItem.title = "Home"
        home.tabBarItem.image = UIImage(systemName: "house")
        
        let homeNav = UINavigationController(rootViewController: home)
        
        let like = LikeTabBarVC(nibName: "LikeTabBarVC", bundle: nil)
        
        like.tabBarItem.title = "Favorites"
        like.tabBarItem.image = UIImage(systemName: "suit.heart")
        let likeNav = UINavigationController(rootViewController: like)
        
        let profile = ProfileTBVC(nibName: "ProfileTBVC", bundle: nil)
        
        profile.tabBarItem.title = "Profile"
        profile.tabBarItem.image = UIImage(systemName: "person.circle")
        let profileNav = UINavigationController(rootViewController: profile)
       
        viewControllers = [homeNav, likeNav, profileNav]
        
        tabBar.backgroundColor = .white
    }
    
}


   

