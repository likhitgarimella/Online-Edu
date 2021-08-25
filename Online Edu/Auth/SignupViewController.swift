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
import MBProgressHUD

class SignupViewController: UIViewController {
    
    // Outlets
    @IBOutlet var nameTextField: FloatLabelTextField!
    @IBOutlet var mobnoTextField: FloatLabelTextField!
    @IBOutlet var emailTextField: FloatLabelTextField!
    @IBOutlet var passTextField: FloatLabelTextField!
    @IBOutlet var confPassTextField: FloatLabelTextField!
    
    var reachability: Reachability?
    
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
    
    /*
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
    */
    
    func apiCalling() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/authentication/register"
            print(url)
            
            let params: [String: Any] = [
                
                "email": self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                "mobileNumber": self.mobnoTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                "name": self.nameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                "password": self.passTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
            ]
            
            print(params)
            print("1111--------------------------------1111")
            
            AF.request(URL.init(string: url)!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
                
                print(response.request!)
                print("2222--------------------------------2222")
                print(response.result)
                print("3333--------------------------------3333")
                print(response.response!)
                print("4444--------------------------------4444")
                
                switch response.result {
                
                case .success(let payload):
                    MBProgressHUD.hide(for: self.view, animated: true)
                    if let x = payload as? Dictionary<String,AnyObject> {
                        print(x)
                        print("5555--------------------------------5555")
                        
                        let resultValue = x as NSDictionary
                        // let message = resultValue["status"] as String
                        guard let message = resultValue["status"] as? String else {return}
                        // let code = resultValue["code"] as! String
                        
                        if message == "SUCCESS" {
                            
                            print("6666--------------------------------6666")
                            
                            // guard let data = resultValue["data"] as? NSDictionary else {return}
                            let data = resultValue["data"] as! NSDictionary
                            // guard let token = resultValue["accessToken"] as? String else {return}
                            // let token = resultValue["accessToken"] as! String
                            // guard let userId = data["_id"] as? String else {return}
                            let userId = data["_id"] as! String
                            
                            print("7777--------------------------------7777")
                            
                            // UserDefaults.standard.setValue("\(token)", forKey: "ApiToken")
                            UserDefaults.standard.setValue(userId, forKey: "UserId")
                            
                            print("8888--------------------------------8888")
                            
                            self.performSegue(withIdentifier: "signupToLogin", sender: self)
                            
                            /*
                            let alertController = UIAlertController(title: "Success!", message: "Welcome", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: nil)
                            */
                            
                        } else {
                            let alertController = UIAlertController(title: "Oops-1", message: "\(message)", preferredStyle: .alert)
                            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            alertController.addAction(alertAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                
                case .failure(let error):
                    print(error)
                    
                    let alertController = UIAlertController(title: "Oops-2", message: "App cannot be connected to the server", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertController.addAction(alertAction)
                    self.present(alertController, animated: true, completion: nil)
                
                }
                
            }
            
        } else {
            let alertController = UIAlertController(title: "Oops-3", message: "Please check your Internet", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
 
    @IBAction func signUpSuccess(_ sender: UIButton) {
        
        // acceptSignup()
        
        func isValidEmail(testStr: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }
        
        if (nameTextField.text?.isEmpty == false && mobnoTextField.text?.isEmpty == false && emailTextField.text?.isEmpty == false && passTextField.text?.isEmpty == false && confPassTextField.text?.isEmpty == false) {
            
            if(self.passTextField.text == self.confPassTextField.text) {
                
                if(isValidEmail(testStr: self.emailTextField.text!)) {
                    
                    if(self.mobnoTextField.text?.count == 10) {
                        
                        /// call api
                        apiCalling()
                        
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
            let alertController = UIAlertController(title: "Oops-4", message: "Please fill all the fields to proceed", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}   // #292
