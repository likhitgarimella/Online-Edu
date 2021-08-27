//
//  InterestsCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class InterestsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var interestBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        interestBtn.layer.cornerRadius = 20
        
    }
    
}   // #22
