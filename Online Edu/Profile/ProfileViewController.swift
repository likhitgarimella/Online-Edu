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
    @IBOutlet var profViewOne: UIView!
    @IBOutlet var profViewTwo: UIView!
    @IBOutlet var profViewThree: UIView!
    @IBOutlet var profViewFour: UIView!
    
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
    
    @IBAction func editProfPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueEditProf", sender: self)
    }
    
    @IBAction func bookmarkPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueFav", sender: self)
    }
    
    // Switch Index of Segmented Control
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            profViewOne.alpha = 1
            profViewTwo.alpha = 0
            profViewThree.alpha = 0
            profViewFour.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            profViewOne.alpha = 0
            profViewTwo.alpha = 1
            profViewThree.alpha = 0
            profViewFour.alpha = 0
        }
        if sender.selectedSegmentIndex == 2 {
            profViewOne.alpha = 0
            profViewTwo.alpha = 0
            profViewThree.alpha = 1
            profViewFour.alpha = 0
        }
        if sender.selectedSegmentIndex == 3 {
            profViewOne.alpha = 0
            profViewTwo.alpha = 0
            profViewThree.alpha = 0
            profViewFour.alpha = 1
        }
        
    }
    
}   // #91
