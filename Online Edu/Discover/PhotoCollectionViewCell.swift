//
//  PhotoCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var hashtagLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var photoImg: UIImageView!
    
    var post: TrendingPost? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        hashtagLabel.text = post?.hashtagString
        descriptionLabel.text = post?.descriptionString
        
    }
    
}   // #30
