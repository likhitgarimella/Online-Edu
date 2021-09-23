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

class CoursesViewController: UIViewController {
    
    @IBOutlet var coursesCollectionView: UICollectionView!
    
    // @IBOutlet weak var searchBar: UISearchBar!
    
    var reachability: Reachability?
    
    var dataInfo: NSMutableArray = []
    
    // var dataInfo: NSMutableArray = [CourseData()]
    // var realDataInfo: NSMutableArray = []
    
    var courseList = [CourseData]()
    
    var searchedList = [CourseData]()
    // var filteredItems = [String]()
    
    /// global labels
    var labelOneText: String?
    var labelTwoText: String?
    var imageUrlString: String?
    
    var searching = false
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
                            
                            // self.realDataInfo = self.dataInfo
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
        
        // remove title for left bar button item
        navigationController?.navigationBar.topItem?.title = ""
        
        coursesCollectionView.backgroundColor = UIColor.white
        
        coursesCollectionView.dataSource = self
        coursesCollectionView.delegate = self
        
        // searchBar.delegate = self
        
        apiCalling()
        
        // fillData()
        
        // configureSearchController()
        
    }
    
    /*
    private func configureSearchController() {
        
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.placeholder = "Search Courses"
        
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = true
        UINavigationBar.appearance().barTintColor = UIColor(red: 87/255, green: 154/255, blue: 243/255, alpha: 1.0)
        
    }
    */
    
    /// Search delg func
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        searchView.backgroundColor = UIColor.white
        return searchView
        
    }
    */
    
    /// Search delg func
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
    
    /// Search delg func
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
    
    /// Search delg func
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
    
    /// Search delg func
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

extension CoursesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataInfo.count
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoursesCollectionViewCell", for: indexPath) as! CoursesCollectionViewCell
        
        // let post = dataInfo[indexPath.row]
        // cell.coursePost = post
        // cell.coursesFeedVC = self
        
        let dic = dataInfo[indexPath.row] as! NSDictionary
        /*
        if (dic["title"] as? String) != "" {
            cell.labelOne.text! = dic["title"] as! String
            print(cell.labelOne.text!)
            // post.titleText = cell.labelOne.text!
            // print(post.titleText)
            // labelOneText = post.titleText
            // print(labelOneText!)
        }
        if (dic["description"] as? String) != "" {
            cell.labelTwo.text! = dic["description"] as! String
            print(cell.labelTwo.text!)
            labelTwoText = cell.labelTwo.text!
            print(labelTwoText!)
        }
        */
        
        let imageUrl = dic["thumbnail"] as! String
        print(imageUrl)
        imageUrlString = imageUrl
        print(imageUrlString!)
        cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "courseImg"))
        
        return cell
        
        /*
        if searching {
            
            let dic = searchedList[indexPath.row] as! NSDictionary
            if (dic["title"] as? String) != "" {
                cell.labelOne.text! = dic["title"] as! String
                print(cell.labelOne.text!)
                post.titleText = cell.labelOne.text!
                print(post.titleText)
                labelOneText = post.titleText
                print(labelOneText!)
            }
            if (dic["description"] as? String) != "" {
                cell.labelTwo.text! = dic["description"] as! String
                print(cell.labelTwo.text!)
                labelTwoText = cell.labelTwo.text!
                print(labelTwoText!)
            }
            let imageUrl = dic["thumbnail"] as! String
            print(imageUrl)
            imageUrlString = imageUrl
            print(imageUrlString!)
            cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "courseImg"))
            
        } else {
            
            let dic = courseList[indexPath.row] as! NSDictionary
            if (dic["title"] as? String) != "" {
                cell.labelOne.text! = dic["title"] as! String
                print(cell.labelOne.text!)
                post.titleText = cell.labelOne.text!
                print(post.titleText)
                labelOneText = post.titleText
                print(labelOneText!)
            }
            if (dic["description"] as? String) != "" {
                cell.labelTwo.text! = dic["description"] as! String
                print(cell.labelTwo.text!)
                labelTwoText = cell.labelTwo.text!
                print(labelTwoText!)
            }
            let imageUrl = dic["thumbnail"] as! String
            print(imageUrl)
            imageUrlString = imageUrl
            print(imageUrlString!)
            cell.photoImg.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "courseImg"))
            
        }
        */
        
    }
    
    // didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CourseDetailViewController") as! CourseDetailViewController
        /*
        /// ref for model 'post'
        let post = courseList[indexPath.row]
        /// storing model's strings in an arrays
        let arr1 = post.authorName
        let arr2 = post.courseName
        let arr3 = post.thumbnail
        let arr4 = post.title
        let arr5 = post.subTitle
        let arr6 = post.rating
        let arr7 = post.enrollCounty
        let arr8 = post.videoLanguage
        let arr9 = post.currentPrice
        let arr10 = post.previousPrice
        let arr11 = post.discountPercent
        let arr12 = post.offerEndsRemainingTime
        let arr13 = post.moneyBackGuaranteeDays
        let arr14 = post.Duration
        let arr15 = post.description
        /// embedding those array strings in global variables
        vc.authorNameLabelVar = arr1!
        vc.courseNameLabelVar = arr2!
        vc.thumbnailImgUrl = arr3!
        vc.titleLabelVar = arr4!
        vc.subTitleLabelVar = arr5!
        vc.ratingLabelVar = arr6!
        vc.enrolCountLabelVar = arr7!
        vc.videoLangLabelVar = arr8!
        vc.currentPriceLabelVar = arr9!
        vc.previousPriceLabelVar = arr10!
        vc.discountPercentLabelVar = arr11!
        vc.offerEndsTimeLabelVar = arr12!
        vc.moneyBackDaysLabelVar = arr13!
        vc.durationLabelVar = arr14!
        vc.descriptionLabelVar = arr15!
        */
        self.present(vc, animated: true, completion: nil)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
        if !searchText.isEmpty {
            
            searching = true
            searchedList.removeAll()
            for item in courseList {
                if ((labelOneText?.lowercased().contains(searchText.lowercased())) != nil) {
                    searchedList.append(item)
                }
            }
            
        } else {
            
            searching = false
            searchedList.removeAll()
            searchedList = courseList
            
        }
        
        coursesCollectionView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searching = false
        searchedList.removeAll()
        coursesCollectionView.reloadData()
        
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
    
}   // #445
