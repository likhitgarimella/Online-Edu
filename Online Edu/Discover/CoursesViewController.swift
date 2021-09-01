//
//  CoursesViewController.swift
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

class CoursesViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet var coursesCollectionView: UICollectionView!
    
    // @IBOutlet weak var searchBar: UISearchBar!
    
    var reachability: Reachability?
    
    var dataInfo: NSMutableArray = []
    
    /// copy of reference
    var realDataInfo: NSMutableArray = []
    
    // var filteredItems = [String]()
    
    /// global label-1
    var labelOneText: String?
    var labelTwoText: String?
    
    func apiCalling() {
        
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
                            self.dataInfo = NSMutableArray(array: data)
                            
                            self.realDataInfo = self.dataInfo
                            self.coursesCollectionView.reloadData()
                            
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
        
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        
        // searchBar.delegate = self
        
        apiCalling()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        searchView.backgroundColor = UIColor.white
        return searchView
        
    }
    
    /*
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        realDataInfo = []
        
        if searchText == "" {
            realDataInfo = dataInfo
        } else {
            for item in dataInfo {
                if (labelOneText!.lowercased().contains(searchText.lowercased())) {
                    realDataInfo.add(item)
                }
            }
        }
        
        self.coursesCollectionView.reloadData()
        
    }
    */
    
    /*
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.dataInfo.removeAllObjects()
        
        for item in self.realDataInfo {
            if (labelOneText!.lowercased().contains(searchBar.text!.lowercased())) {
                self.dataInfo.add(item)
            }
        }
        
        if (searchBar.text!.isEmpty) {
            self.dataInfo = self.realDataInfo
        }
        
        self.coursesCollectionView.reloadData()
        
    }
    */
 
    /*
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.dataInfo.removeAllObjects()
        
        for item in self.realDataInfo {
            if (labelOneText!.lowercased().contains(searchBar.text!.lowercased())) {
                self.dataInfo.add(item)
            }
        }
        
        if (searchBar.text!.isEmpty) {
            self.dataInfo = self.realDataInfo
        }
        
        self.coursesCollectionView.reloadData()
        
    }
    */
    
    /*
    func searchBarSearchButtonClicked(for searchController: UISearchController) {
        
        filteredItems.removeAll(keepingCapacity: false)
        
        filteredItems = (dataInfo as NSArray as! [String]).filter {
            item in
            item.lowercased().contains(searchController.searchBar.text!.lowercased())
        }
        
        if (searchController.searchBar.text!.isEmpty) {
            self.dataInfo = self.realDataInfo
        }
        
        coursesCollectionView.reloadData()
        
    }
    */
    
}

extension CoursesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realDataInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
        
        let dic = realDataInfo[indexPath.row] as! NSDictionary
        if (dic["title"] as? String) != "" {
            cell.labelOne.text! = dic["title"] as! String
            print(cell.labelOne.text!)
            labelOneText = cell.labelOne.text!
            print(labelOneText!)
        }
        if (dic["description"] as? String) != "" {
            cell.labelTwo.text! = dic["description"] as! String
        }
        let imageUrl = dic["thumbnail"] as! String
        cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "courseImg"))
        
        return cell
        
    }
    
}

extension CoursesViewController: UICollectionViewDelegateFlowLayout {
    
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
    
}   // #260
