//
//  TrendingViewController.swift
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

class TrendingViewController: UIViewController {
    
    @IBOutlet var trendingCollectionView: UICollectionView!
    
    var reachability: Reachability?
    
    // var posts: [TrendingPost] = []
    var dataInfo: NSMutableArray = []
    
    func apiCalling() {
        
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
                            self.dataInfo = NSMutableArray(array: data)
                            
                            // guard let token = resultValue["accessToken"] as? String else {return}
                            // let token = resultValue["accessToken"] as! String
                            // let token = data["accessToken"] as! String
                            // guard let userId = data["_id"] as? String else {return}
                            // let userId = data["_id"] as! String
                            
                            self.trendingCollectionView.reloadData()
                            
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
        
        trendingCollectionView.backgroundColor = UIColor.white
        
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate = self
        
        apiCalling()
        
    }
    
}

extension TrendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCollectionViewCell", for: indexPath) as! TrendingCollectionViewCell
        // let post = posts[indexPath.row]
        // cell.post = post
        
        let dic = dataInfo[indexPath.row] as! NSDictionary
        if (dic["hashtags"] as? String) != "" {
            cell.hashtagLabel.text! = dic["hashtags"] as! String
        }
        if (dic["description"] as? String) != "" {
            cell.descriptionLabel.text! = dic["description"] as! String
        }
        let imageUrl = dic["fileURL"] as! String
        cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "trendImg"))
        
        return cell
        
    }
    
}

extension TrendingViewController: UICollectionViewDelegateFlowLayout {
    
    // spacing b/w rows in coll view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        /// spacing distance = 2
        return 8
    }
    
    // spacing b/w columns in coll view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// shrink by 1 point for each cell, so that spacing becomes 2 b/w cell-to-cell
        return CGSize(width: collectionView.frame.size.width / 3 - 2, height: collectionView.frame.size.width / 3 - 2)
    }
    
}   // #170
