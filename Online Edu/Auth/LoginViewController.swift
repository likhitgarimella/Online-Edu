//
//  LoginViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 20/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet var emailTextField: FloatLabelTextField!
    @IBOutlet var passTextField: FloatLabelTextField!
    
    func UnderlineTextField() {
        
        emailTextField.setUnderLine()
        passTextField.setUnderLine()
        
    }
    
    func LeftPadding() {
        
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        passTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: passTextField.frame.height))
        passTextField.leftViewMode = .always
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        UnderlineTextField()
        LeftPadding()
        
    }
    
    @IBAction func loginSucess(_ sender: UIButton) {
        
        acceptLogin { (success) in
            
            if success {
                let url2 = "http://3.108.14.230:3333/api/authentication/getProfile"
                if let token = UserDefaults.standard.string(forKey: "token") {
                    
                    let header : HTTPHeaders = [
                        "accessToken": token
                    ]
                    
                    AF.request(url2, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).validate().responseJSON { (response) in
                        
                        print(response)
                        
                        switch response.result {
                        
                        case .success(let value):
                            let swiftyjson = JSON(value).object
                            print("--------------------------------")
                            
                            let array = swiftyjson as? [String: AnyObject]
                            
                            if let name = array? ["name"] {
                                UserDefaults.standard.set(name, forKey: "name")
                            }
                            if let email = array? ["email"] {
                                UserDefaults.standard.set(email, forKey: "email")
                            }
                            if let mobileNumber = array? ["mobileNumber"] {
                                UserDefaults.standard.set(mobileNumber, forKey: "mobileNumber")
                            }
                            break
                        
                        case .failure(let error):
                            print(error.localizedDescription)
                        
                        }
                        
                    }
                    
                }
                
            } else {
                print("--------Error--------")
            }
            
        }
        
    }
    
    typealias CompletionHandler = (_ success: Bool) -> Void
    func acceptLogin(completionHandler: @escaping CompletionHandler) {
        
        if self.emailTextField.text?.isEmpty == false && self.passTextField.text?.isEmpty == false {
            
            let url = "http://3.108.14.230:3333/api/authentication/login"
            print(url)
            
            self.view.makeToast("Please wait...")
            
            let parameters: [String: Any] = [
                
                "email": self.emailTextField.text!,
                "password": self.passTextField.text!
                
            ]
            
            print(parameters)
            
            AF.request(URL.init(string: url)!, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
                
                print(response.result)
                
                switch response.result {
                
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    
                    let stringValue = json["data"].rawString()
                    
                    if stringValue == "true" {
                        let headerJson = JSON(response.response?.allHeaderFields as Any)
                        if let token = headerJson["accessToken"].rawString() {
                            UserDefaults.standard.set(token, forKey: "accessToken")
                        }
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        self.performSegue(withIdentifier: "loginToHome", sender: self)
                        print(headerJson)
                    }
                    
                    else if json["data"].rawString() == "User already registered" {
                        let message = json["data"].rawString()
                        let alertController = UIAlertController(title: "Oops-1", message: message, preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion: nil)
                        print("Hello there!!")
                    }
                    
                    else {
                        let message = json["data"].rawString()
                        let alertController = UIAlertController(title: "Oops-2", message: message, preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    completionHandler(true)
                    break
                
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false)
                
                }
                
            }
            
        } else {
            let alertController = UIAlertController(title: "Oops-3", message: "Please enter all the fields", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
}   // #174
