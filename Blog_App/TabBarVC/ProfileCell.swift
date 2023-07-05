//
//  ProfileCell.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 13/06/23.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var setImage: UIImageView!
    @IBOutlet weak var editLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        conteneirView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
}
