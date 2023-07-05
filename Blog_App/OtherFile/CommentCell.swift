//
//  CommentCell.swift
//  Blog_App
//
//  Created by Abdusamad Mamasoliyev on 04/07/23.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var conteneirView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        conteneirView.layer.borderColor = UIColor.black.cgColor
        conteneirView.layer.borderWidth = 1
        conteneirView.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
