//
//  SegmThreeCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 28/09/21.
//

import UIKit

class SegmThreeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var profSegmImg: UIImageView!
    @IBOutlet var indexLbl: UILabel!
    @IBOutlet var viewLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profSegmImg.layer.cornerRadius = 12
        
    }
    
}   // #15
