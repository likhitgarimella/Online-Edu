//
//  CoursesCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class CoursesCollectionViewCell: UICollectionViewCell {
    
    // @IBOutlet var labelOne: UILabel!
    // @IBOutlet var labelTwo: UILabel!
    @IBOutlet var photoImg: UIImageView!
    // @IBOutlet var bottomView: UIView!
    
    /// linking feed VC & post cell
    var coursesFeedVC: CoursesViewController?
    
    var coursePost: CourseData? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        // labelOne.text = coursePost?.titleText
        // labelTwo.text = coursePost?.descText
        
        if let photoUrlString = coursePost?.thumbnail {
            let photoUrl = URL(string: photoUrlString)
            photoImg.sd_setImage(with: photoUrl)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImg.layer.cornerRadius = 12
        // bottomView.layer.cornerRadius = 12
        // bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    
}   // #48
