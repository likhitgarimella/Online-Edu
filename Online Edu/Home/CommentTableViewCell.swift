//
//  CommentTableViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/10/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 20
        profileImageView.layer.borderColor = UIColor.systemBlue.cgColor
        profileImageView.layer.borderWidth = 1.5
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
}   // #33
