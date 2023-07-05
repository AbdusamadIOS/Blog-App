//
//  MainVC.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 12/06/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var singInBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singInBtn.layer.cornerRadius = 15
        createBtn.layer.cornerRadius = 15
        
    }

    @IBAction func singInBtn(_ sender: UIButton) {
        
        let vc = SingInVC(nibName: "SingInVC", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
        
    }
    
    @IBAction func createBtn(_ sender: UIButton) {
        
        let vc1 = CreateAcVC(nibName: "CreateAcVC", bundle: nil)
        
        vc1.modalTransitionStyle = .coverVertical
        vc1.modalPresentationStyle = .fullScreen
        
        self.present(vc1, animated: true)
    }
    
}
