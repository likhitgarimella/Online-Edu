//
//  HomeViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 19/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// present onboarding screen for the first time
        showOnboardingIfNeeded()
        
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
    
}   // #34
