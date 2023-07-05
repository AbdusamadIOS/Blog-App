//
//  HomeCell.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 13/06/23.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var blogMavzusiLbl: UILabel!
    @IBOutlet weak var blogTarifLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 28
        conteneirView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
