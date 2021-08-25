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
import MBProgressHUD

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet var emailTextField: FloatLabelTextField!
    @IBOutlet var passTextField: FloatLabelTextField!
    
    var reachability: Reachability?
    
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
    
    func apiCalling() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/authentication/login"
            print(url)
            
            let params: [String: Any] = [
                
                "email": self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines),
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
                            let token = data["accessToken"] as! String
                            // guard let userId = data["_id"] as? String else {return}
                            // let userId = data["_id"] as! String
                            
                            print("7777--------------------------------7777")
                            
                            UserDefaults.standard.setValue("\(token)", forKey: "ApiToken")
                            // UserDefaults.standard.setValue(userId, forKey: "UserId")
                            
                            print("8888--------------------------------8888")
                            
                            self.performSegue(withIdentifier: "loginToHome", sender: self)
                            
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
    
    @IBAction func loginSucess(_ sender: UIButton) {
        
        func isValidEmail(testStr: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        if (emailTextField.text?.isEmpty == false || passTextField.text?.isEmpty == false) {
            
            /// call api
            apiCalling()
            
        } else {
            let alertController = UIAlertController(title: "Oops", message: "Please enter all the fields", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        /*
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
        */
        
    }
    
    /*
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
    */
    
}   // #308
