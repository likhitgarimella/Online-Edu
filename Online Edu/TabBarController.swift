//
//  TabBarController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 25/09/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor(red: 87/255, green: 154/255, blue: 243/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        
    }
    
}   // #23
