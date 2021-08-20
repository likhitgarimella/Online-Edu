//
//  SignupViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 20/08/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    // Outlets
    @IBOutlet var emailTextField: FloatLabelTextField!
    @IBOutlet var passTextField: FloatLabelTextField!
    @IBOutlet var confPassTextField: FloatLabelTextField!
    
    func UnderlineTextField() {
        
        emailTextField.setUnderLine()
        passTextField.setUnderLine()
        confPassTextField.setUnderLine()
        
    }
    
    func LeftPadding() {
        
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        passTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: passTextField.frame.height))
        passTextField.leftViewMode = .always
        confPassTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: confPassTextField.frame.height))
        confPassTextField.leftViewMode = .always
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        UnderlineTextField()
        LeftPadding()
        
    }
    
}   // #46
