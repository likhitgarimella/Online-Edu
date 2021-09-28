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
        
        contentView.backgroundColor = UIColor.white
        interestBtn.layer.cornerRadius = 20
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        sender.backgroundColor = sender.backgroundColor == UIColor(red: 44/255, green: 127/255, blue: 228/255, alpha: 1.0) ? UIColor(red: 196/255, green: 222/255, blue: 255/255, alpha: 1.0) : UIColor(red: 44/255, green: 127/255, blue: 228/255, alpha: 1.0)
        
        interestBtn.setTitleColor(UIColor.white, for: .normal)
        // sender.setTitleColor(UIColor.white, for: .normal) == sender.setTitleColor(UIColor.white, for: .normal) ? UIColor.white : UIColor.black
        
    }
    
}   // #32
