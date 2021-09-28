//
//  DiscoverViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import Toast_Swift
import MBProgressHUD
import SDWebImage

class DiscoverViewController: UIViewController {
    
    @IBOutlet var livePreviewCollectionView: UICollectionView!
    @IBOutlet var authorsPreviewCollectionView: UICollectionView!
    @IBOutlet var coursesPreviewCollectionView: UICollectionView!
    @IBOutlet var trendingPreviewCollectionView: UICollectionView!
    
    var reachability: Reachability?
    
    var dataInfoOne: NSMutableArray = []
    var dataInfoTwo: NSMutableArray = []
    var dataInfoThree: NSMutableArray = []
    
    /// images in coll view
    var items = [UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex")]
    
    func apiCallingAuthors() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/author/get"
            print(url)
            
            AF.request(URL.init(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                
                print(response.request!)
                print("1111--------------------------------1111")
                print(response.result)
                print("2222--------------------------------2222")
                print(response.response!)
                print("3333--------------------------------3333")
                
                switch response.result {
                
                case .success(let payload):
                    MBProgressHUD.hide(for: self.view, animated: true)
                    if let x = payload as? Dictionary<String,AnyObject> {
                        print(x)
                        print("4444--------------------------------4444")
                        
                        let resultValue = x as NSDictionary
                        // let message = resultValue["status"] as String
                        guard let message = resultValue["status"] as? String else {return}
                        // let code = resultValue["code"] as! String
                        
                        if message == "SUCCESS" {
                            
                            print("5555--------------------------------5555")
                            
                            // guard let data = resultValue["data"] as? NSDictionary else {return}
                            let data = resultValue["data"] as! NSArray
                            self.dataInfoOne = NSMutableArray(array: data)
                            
                            // guard let token = resultValue["accessToken"] as? String else {return}
                            // let token = resultValue["accessToken"] as! String
                            // let token = data["accessToken"] as! String
                            // guard let userId = data["_id"] as? String else {return}
                            // let userId = data["_id"] as! String
                            
                            self.authorsPreviewCollectionView.reloadData()
                            
                            print("6666--------------------------------6666")
                            
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
    
    func apiCallingCourses() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/course/get"
            print(url)
            
            AF.request(URL.init(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                
                print(response.request!)
                print("1111--------------------------------1111")
                print(response.result)
                print("2222--------------------------------2222")
                print(response.response!)
                print("3333--------------------------------3333")
                
                switch response.result {
                
                case .success(let payload):
                    MBProgressHUD.hide(for: self.view, animated: true)
                    if let x = payload as? Dictionary<String,AnyObject> {
                        print(x)
                        print("4444--------------------------------4444")
                        
                        let resultValue = x as NSDictionary
                        guard let message = resultValue["status"] as? String else {return}
                        
                        if message == "SUCCESS" {
                            
                            print("5555--------------------------------5555")
                            
                            let data = resultValue["data"] as! NSArray
                            self.dataInfoTwo = NSMutableArray(array: data)
                            
                            // self.realDataInfo = self.dataInfo
                            self.coursesPreviewCollectionView.reloadData()
                            
                            print("6666--------------------------------6666")
                            
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
    
    func apiCallingTrending() {
        
        do {
            self.reachability = try Reachability.init()
        }
        catch {
            print("Unable to start notifier")
        }
        
        if ((reachability!.connection) != .unavailable) {
            
            MBProgressHUD.showAdded(to: self.view, animated: true)
            
            let url = "http://3.108.14.230:3333/api/trendings/get"
            print(url)
            
            AF.request(URL.init(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
                
                print(response.request!)
                print("1111--------------------------------1111")
                print(response.result)
                print("2222--------------------------------2222")
                print(response.response!)
                print("3333--------------------------------3333")
                
                switch response.result {
                
                case .success(let payload):
                    MBProgressHUD.hide(for: self.view, animated: true)
                    if let x = payload as? Dictionary<String,AnyObject> {
                        print(x)
                        print("4444--------------------------------4444")
                        
                        let resultValue = x as NSDictionary
                        // let message = resultValue["status"] as String
                        guard let message = resultValue["status"] as? String else {return}
                        // let code = resultValue["code"] as! String
                        
                        if message == "SUCCESS" {
                            
                            print("5555--------------------------------5555")
                            
                            // guard let data = resultValue["data"] as? NSDictionary else {return}
                            let data = resultValue["data"] as! NSArray
                            self.dataInfoThree = NSMutableArray(array: data)
                            
                            // guard let token = resultValue["accessToken"] as? String else {return}
                            // let token = resultValue["accessToken"] as! String
                            // let token = data["accessToken"] as! String
                            // guard let userId = data["_id"] as? String else {return}
                            // let userId = data["_id"] as! String
                            
                            self.trendingPreviewCollectionView.reloadData()
                            
                            print("6666--------------------------------6666")
                            
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
        
        self.navigationItem.title = "Discover"
        
        livePreviewCollectionView.backgroundColor = UIColor.white
        authorsPreviewCollectionView.backgroundColor = UIColor.white
        coursesPreviewCollectionView.backgroundColor = UIColor.white
        trendingPreviewCollectionView.backgroundColor = UIColor.white
        
        livePreviewCollectionView.dataSource = self
        livePreviewCollectionView.delegate = self
        authorsPreviewCollectionView.dataSource = self
        authorsPreviewCollectionView.delegate = self
        coursesPreviewCollectionView.dataSource = self
        coursesPreviewCollectionView.delegate = self
        trendingPreviewCollectionView.dataSource = self
        trendingPreviewCollectionView.delegate = self
        
        apiCallingAuthors()
        apiCallingCourses()
        apiCallingTrending()
        
    }
    
    @IBAction func livePressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "live", sender: self)
        
    }
    
    @IBAction func authorsPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "authors", sender: self)
        
    }
    
    @IBAction func coursesPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "courses", sender: self)
        
    }
    
    @IBAction func trendingPressed(_ sender: UIButton) {
        
        let taptic = UIImpactFeedbackGenerator(style: .light)
        taptic.prepare()
        taptic.impactOccurred()
        
        self.performSegue(withIdentifier: "trending", sender: self)
        
    }
    
}

extension DiscoverViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == authorsPreviewCollectionView {
            return dataInfoOne.count
        }
        if collectionView == coursesPreviewCollectionView {
            return dataInfoTwo.count
        }
        if collectionView == trendingPreviewCollectionView {
            return dataInfoThree.count
        }
        /// static
        return (items.count)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == authorsPreviewCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorsPreviewCell", for: indexPath) as! AuthorsPreviewCell
            let dic = dataInfoOne[indexPath.row] as! NSDictionary
            let imageUrl = dic["fileURL"] as! String
            cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "trendImg"))
            return cell
        }
        if collectionView == coursesPreviewCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesPreviewCell", for: indexPath) as! CoursesPreviewCell
            let dic = dataInfoTwo[indexPath.row] as! NSDictionary
            let imageUrl = dic["thumbnail"] as! String
            cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "courseImg"))
            return cell
        }
        if collectionView == trendingPreviewCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingPreviewCell", for: indexPath) as! TrendingPreviewCell
            let dic = dataInfoThree[indexPath.row] as! NSDictionary
            let imageUrl = dic["fileURL"] as! String
            cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "trendImg"))
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LivePreviewCell", for: indexPath) as! LivePreviewCell
        cell.photoImg.image = items[indexPath.row]
        return cell
        
    }
    
}   // #394
