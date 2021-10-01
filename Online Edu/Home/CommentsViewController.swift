//
//  CommentsViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/10/21.
//

import Foundation
import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var commentsView: UIView!
    
    func Properties() {
        
        commentsView.layer.cornerRadius = 36
        
        commentsView.layer.masksToBounds = false
        commentsView.layer.shadowRadius = 20
        commentsView.layer.shadowOpacity = 1
        commentsView.layer.shadowColor = UIColor.gray.cgColor
        commentsView.layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let childView = UIHostingController(rootView: CommentsView())
        addChild(childView)
        theContainer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        childView.view.frame = theContainer.bounds
        theContainer.addSubview(childView.view)
        */
        
        Properties()
        
    }
    
}   // #42
