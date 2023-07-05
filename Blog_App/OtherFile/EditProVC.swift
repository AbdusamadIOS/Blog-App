//
//  EditProVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 13/06/23.
//

import UIKit
import CoreData

class EditProVC: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var updataBtn: UIButton!
    
    var closure:((Profile) -> Void)?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext
        userImage.layer.cornerRadius = 65
        userImage.clipsToBounds = true
        updataBtn.layer.cornerRadius = 10
        
    }
    
    @IBAction func editPhoto(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default ) { _ in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                let imagePicker = UIImagePickerController()
                
                imagePicker.sourceType = .camera
                imagePicker.allowsEditing = true
                
                self.present(imagePicker, animated: true)
            }else{
                let alert = UIAlertController(title: "Camera is not available on this device", message: nil, preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Ok", style: .default)
                
                alert.addAction(ok)
                
                self.present(alert, animated: true)
            }
        }
        
        let gallery = UIAlertAction(title: "Gallery", style: .default) { _ in
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(camera)
        alert.addAction(gallery)
        alert.addAction(cancel)
        self.present( alert, animated: true)
    }

   
    
    @IBAction func updataBtn(_ sender: UIButton) {
        
        let newElement = Profile(context: self.context!)
        
        newElement.name = surnameTF.text
        newElement.email = emailTF.text


        if let closure {
            closure(newElement)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension EditProVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            userImage.image = image
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}
