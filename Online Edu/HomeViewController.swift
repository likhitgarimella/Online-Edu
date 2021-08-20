//
//  HomeViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 19/08/21.
//  Copyright © 2021 Likhit Garimella. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Outlets
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var loginView: UIView!
    @IBOutlet var signupView: UIView!
    
    func SegmentFontColor() {
        
        // Selected option color
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        // Color of other options
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// present onboarding screen for the first time
        showOnboardingIfNeeded()
        
        hideKeyboardWhenTappedAround()
        SegmentFontColor()
        
    }
    
    // Switch Index of Segmented Control
    @IBAction func switchSegment(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            loginView.alpha = 1
            signupView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            loginView.alpha = 0
            signupView.alpha = 1
        }
        
    }
    
    /// Onboarding setup
    fileprivate func showOnboardingIfNeeded() {
        
        guard let onboardingController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        
        if !onboardingController.alreadyShown() {
            DispatchQueue.main.async {
                self.present(onboardingController, animated: true)
            }
        }
        
    }
    
}   // #66
