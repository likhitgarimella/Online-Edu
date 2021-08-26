//
//  DiscoverViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func livePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "live", sender: self)
        
    }
    
    @IBAction func coursesPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "courses", sender: self)
        
    }
    
    @IBAction func trendingPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "trending", sender: self)
        
    }
    
}   // #38
