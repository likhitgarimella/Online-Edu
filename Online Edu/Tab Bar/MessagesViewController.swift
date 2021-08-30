//
//  MessagesViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 28/08/21.
//

import UIKit

class MessagesViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Direct Message"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
    }
    
}   // #26
