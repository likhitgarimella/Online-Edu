//
//  SignupViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 20/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class SignupViewController: UIViewController {
    
    // Outlets
    @IBOutlet var nameTextField: FloatLabelTextField!
    @IBOutlet var mobnoTextField: FloatLabelTextField!
    @IBOutlet var emailTextField: FloatLabelTextField!
    @IBOutlet var passTextField: FloatLabelTextField!
    @IBOutlet var confPassTextField: FloatLabelTextField!
    
    func UnderlineTextField() {
        
        nameTextField.setUnderLine()
        mobnoTextField.setUnderLine()
        emailTextField.setUnderLine()
        passTextField.setUnderLine()
        confPassTextField.setUnderLine()
        
    }
    
    func LeftPadding() {
        
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: nameTextField.frame.height))
        nameTextField.leftViewMode = .always
        mobnoTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: mobnoTextField.frame.height))
        mobnoTextField.leftViewMode = .always
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
    
    func acceptSignup() {
        
        func isValidEmail(testStr: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }
        
        if (self.nameTextField.text?.isEmpty == false && self.mobnoTextField.text?.isEmpty == false && self.emailTextField.text?.isEmpty == false && self.passTextField.text?.isEmpty == false && self.confPassTextField.text?.isEmpty == false) {
            
            if(self.passTextField.text == self.confPassTextField.text) {
                
                if(isValidEmail(testStr: self.emailTextField.text!)) {
                    
                    if(self.mobnoTextField.text?.count == 10) {
                        
                        let url = "http://3.108.14.230:3333/api/authentication/register"
                        print(url)
                        
                        let parameters: [String: Any] = [
                            
                            "email": self.emailTextField.text!,
                            "mobileNumber": self.mobnoTextField.text!,
                            "name": self.nameTextField.text!,
                            "password": self.passTextField.text!
                            
                        ]
                        
                        print(parameters)
                        
                        AF.request(URL.init(string: url)!, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
                            
                            print(response.result)
                            
                            switch response.result {
                            
                            case .success(let value):
                                let json = JSON(value)
                                print(json)
                                
                                let stringValue = json["success"].rawString()
                                
                                if stringValue == "true" {
                                    self.performSegue(withIdentifier: "signupToLogin", sender: self)
                                } else {
                                    let message = json["error"].rawString()
                                    ///
                                    let alertController = UIAlertController(title: "Oops", message: message, preferredStyle: .alert)
                                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                                                                    alertController.addAction(alertAction)
                                    self.present(alertController, animated: true, completion: nil)
                                }
                                break
                            
                            case .failure(let error):
                                print(error.localizedDescription)
                                
                            }
                            
                        }
                        
                    } else {
                        self.view.makeToast("Mobile number should be 10 digits")
                    }
                    
                } else {
                    self.view.makeToast("Enter valid email address")
                }
                
            } else {
                self.view.makeToast("Passwords don't match")
            }
            
        } else {
            let alertController = UIAlertController(title: "Oops!", message: "Please fill all the fields to proceed", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func signUpSuccess(_ sender: UIButton) {
        
        acceptSignup()
        
    }
    
}   // #145
