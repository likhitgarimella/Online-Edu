//
//  CourseDetailViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 16/09/21.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var thumbnailImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var enrolCountLabel: UILabel!
    @IBOutlet weak var videoLangLabel: UILabel!
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var previousPriceLabel: UILabel!
    @IBOutlet weak var discountPercentLabel: UILabel!
    @IBOutlet weak var offerEndsTimeLabel: UILabel!
    @IBOutlet weak var moneyBackDaysLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // Decls
    var authorNameLabelVar = ""
    var courseNameLabelVar = ""
    var thumbnailImgUrl = ""
    var titleLabelVar = ""
    var subTitleLabelVar = ""
    var ratingLabelVar = ""
    var enrolCountLabelVar = ""
    var videoLangLabelVar = ""
    var currentPriceLabelVar = ""
    var previousPriceLabelVar = ""
    var discountPercentLabelVar = ""
    var offerEndsTimeLabelVar = ""
    var moneyBackDaysLabelVar = ""
    var durationLabelVar = ""
    var descriptionLabelVar = ""
    
    func Properties() {
        
        /*
        authorNameLabel.numberOfLines = 0
        authorNameLabel.contentMode = .topLeft
        authorNameLabel.sizeToFit()
        */
         
    }
    
    func Function() {
        
        /*
        authorNameLabel.text = authorNameLabelVar
        courseNameLabel.text = courseNameLabelVar
        
        let photoUrl = URL(string: thumbnailImgUrl)
        thumbnailImg.sd_setImage(with: photoUrl)
        */
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        view.backgroundColor = .white
        
        Properties()
        Function()
        
    }
    
}   // #80
