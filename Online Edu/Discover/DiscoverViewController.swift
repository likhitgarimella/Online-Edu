//
//  DiscoverViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    @IBOutlet var livePreviewCollectionView: UICollectionView!
    @IBOutlet var authorsPreviewCollectionView: UICollectionView!
    @IBOutlet var coursesPreviewCollectionView: UICollectionView!
    @IBOutlet var trendingPreviewCollectionView: UICollectionView!
    
    /// images in coll view
    var items = [UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex"), UIImage(named: "alex")]
    
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
        /// static
        return (items.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LivePreviewCell", for: indexPath) as! LivePreviewCell
        cell.photoImg.image = items[indexPath.row]
        return cell
        
    }
    
}   // #99
