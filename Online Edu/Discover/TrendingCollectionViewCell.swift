//
//  PhotoCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell {
    
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
    
    /*
    var post: TrendingPost? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        hashtagLabel.text = post?.hashtagString
        descriptionLabel.text = post?.descriptionString
        
    }
    */
    
}   // #42
