//
//  ChangePassVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 13/06/23.
//

import UIKit

class ChangePassVC: UIViewController {

    @IBOutlet weak var currentTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var newPasswordAgainTF: UITextField!
    @IBOutlet weak var updataBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        updataBtn.layer.cornerRadius = 10
        
    }

    @IBAction func updataBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
   

}
