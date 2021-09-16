//
//  AuthorsCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 28/08/21.
//

import UIKit

class AuthorsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var hashtagLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var photoImg: UIImageView!
    @IBOutlet var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImg.layer.cornerRadius = 12
        bottomView.layer.cornerRadius = 12
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    
}   // #28
