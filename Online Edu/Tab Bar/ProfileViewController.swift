//
//  ProfileViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var editProf: UIButton!
    @IBOutlet weak var bookmark: UIButton!
    @IBOutlet var segment: UISegmentedControl!
    
    func Properties() {
        
        editProf.layer.cornerRadius = 4
        bookmark.layer.cornerRadius = 4
        editProf.layer.borderWidth = 1
        bookmark.layer.borderWidth = 1
        editProf.layer.borderColor = UIColor.lightGray.cgColor
        bookmark.layer.borderColor = UIColor.lightGray.cgColor
        bookmark.setTitle("", for: .normal)
        
    }
    
    func SegmentFontColor() {
        
        // Selected option color
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        // Color of other options
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Properties()
        SegmentFontColor()
        
        hideKeyboardWhenTappedAround()
    }
    
}   // #48
