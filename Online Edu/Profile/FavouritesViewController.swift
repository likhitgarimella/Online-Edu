//
//  FavouritesViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 28/09/21.
//

import UIKit
import WMSegmentControl

class FavouritesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        let anotherSegment = WMSegment(frame: CGRect(x: 10, y: 100, width: self.view.frame.width-20, height: 50))
        anotherSegment.type = .normal
        anotherSegment.selectorType = .bottomBar
        
        /// set titles of your segment
        anotherSegment.buttonTitles = "VIDEOS, HASHTAGS, SOUNDS, EFFECTS, PRODUCTS"
        /// set text color for segment value
        anotherSegment.textColor = .darkGray
        /// set text color for selected segment value
        anotherSegment.selectorTextColor = .black
        /// set color for selected segment
        anotherSegment.selectorColor = UIColor(red: 44/255, green: 127/255, blue: 228/255, alpha: 1.0)
        /// set font for selected segment value
        anotherSegment.SelectedFont = UIFont(name: "Poppins-Regular", size: 12)!
        /// set font for segment options
        anotherSegment.normalFont = UIFont(name: "Poppins-Regular", size: 12)!
        
        self.view.addSubview(anotherSegment)
        
    }
    
}   // #41
