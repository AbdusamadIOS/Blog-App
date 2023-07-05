//
//  CoreDataManager.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 05/07/23.
//

import Foundation
import UIKit
import CoreData

struct CoreDataManager {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    init() {
        context = appDelegate.persistentContainer.viewContext
    }
    
    func getUser(userName: String) -> User? {
        
        let request = User.fetchRequest()
        
        let predicate = NSPredicate(format: "userName MATCHES %@", userName)
        request.predicate = predicate
        
        if let user = try? context?.fetch(request).first {
            return user
        }else {
            return nil
        }
    }
    
    func getBlogs(ofUser: Bool = false) -> [Blog] {
        
        if ofUser {
            
            let userName = UserDefaults.standard.string(forKey: "userName")
            let user = getUser(userName: userName!)
            return user?.blogs?.allObjects as! [Blog]
        } else {
            let request = Blog.fetchRequest()
            
            if let blogs = try? context?.fetch(request) {
                return blogs
            }
        }
        
        return []
    }
    
    func getComments(of blog: Blog) -> [Comment] {
        
        return blog.comments?.allObjects as! [Comment]
    }
    
    func createUser(userName: String, firstName: String, lastName: String, password: String) {
        
        if let _ = getUser(userName: userName) {
            print("User is exist")
        } else {
            
            let newUser = User(context: self.context!)
            
            newUser.userName = userName
            newUser.firstName = firstName
            newUser.lastName = lastName
            newUser.password = password
            
            
            appDelegate.saveContext()
        }
    }
    
    func createBlog(topic: String, context: String) {
        
        let userName = UserDefaults.standard.string(forKey: "userName")
        let user = getUser(userName: userName!)
        
        let newBlog = Blog(context: self.context!)
        newBlog.topic = topic
        newBlog.content = context
        newBlog.author = user
        
        appDelegate.saveContext()
    }
    
    func createComment(message: String, blog: Blog) {
        
        let userName = UserDefaults.standard.string(forKey: "userName")
        let user = getUser(userName: userName!)
        
        let newComment = Comment(context: self.context!)
        
        newComment.message = message
        newComment.blog = blog
        newComment.author = user
        
        appDelegate.saveContext()
        
        
    }
}
