//
//  AuthorsPreviewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 28/09/21.
//

import UIKit

class AuthorsPreviewCell: UICollectionViewCell {
    
    @IBOutlet var photoImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImg.layer.cornerRadius = 10
        
    }
    
}   // #22
