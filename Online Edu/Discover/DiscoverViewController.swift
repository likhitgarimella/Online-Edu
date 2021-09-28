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
        
        self.navigationItem.title = "Discover"
        
    }
    
    @IBAction func livePressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "live", sender: self)
        
    }
    
    @IBAction func authorsPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "authors", sender: self)
        
    }
    
    @IBAction func coursesPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "courses", sender: self)
        
    }
    
    @IBAction func trendingPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "trending", sender: self)
        
    }
    
}   // #60
