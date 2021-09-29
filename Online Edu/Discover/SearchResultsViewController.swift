//
//  SearchResultsViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/09/21.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    
    func Properties() {
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: searchTextField.frame.height))
        searchTextField.leftViewMode = .always
        searchTextField.layer.cornerRadius = 20
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        Properties()
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
    }
    
}   // #37
