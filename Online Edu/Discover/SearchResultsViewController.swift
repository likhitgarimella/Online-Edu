//
//  SearchResultsViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/09/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift
import MBProgressHUD

class SearchResultsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var resultsLabel: UILabel!
    
    var reachability: Reachability?
    
    func Properties() {
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: searchTextField.frame.height))
        searchTextField.leftViewMode = .always
        searchTextField.layer.cornerRadius = 20
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchBtn.layer.cornerRadius = 4
        searchBtn.layer.borderWidth = 1
        searchBtn.layer.borderColor = UIColor.gray.cgColor
    }
    
    func searchApiCalling() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/Author/search"
            print(url)
            
            let params: [String: Any] = [
                
                "search": self.searchTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
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
                        
                        guard let message = resultValue["status"] as? String else {return}
                        
                        if message == "SUCCESS" {
                            
                            print("6666--------------------------------6666")
                            
                            let data = resultValue["data"] as! NSDictionary
                            print("Data")
                            print(data)
                            
                            self.resultsLabel.text = "\(data)"
                            
                            let categoryOne = data["Author"] as! NSArray
                            print("Category")
                            print(categoryOne)
                            
                            // self.resultsLabel.text = "\(category)"
                            
                            // let userId = category[0]
                            // print("User Id")
                            // print(userId)
                            
                            print("7777--------------------------------7777")
                            
                            // UserDefaults.standard.setValue(userId, forKey: "UserId")
                            
                            // print("8888--------------------------------8888")
                            
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        Properties()
        
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchApiCalling()
    }
    
}   // #148
