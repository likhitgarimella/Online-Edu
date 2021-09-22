//
//  LiveViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

class LiveViewController: UIViewController {
    
    @IBOutlet var liveCollectionView: UICollectionView!
    
    var dataInfo: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liveCollectionView.backgroundColor = UIColor.white
        
        liveCollectionView.dataSource = self
        liveCollectionView.delegate = self
        
    }
    
}

extension LiveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// static
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCollectionViewCell", for: indexPath) as! LiveCollectionViewCell
        
        return cell
        
    }
    
}

extension LiveViewController: UICollectionViewDelegateFlowLayout {
    
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
        return CGSize(width: collectionView.frame.size.width / 2 - 2, height: collectionView.frame.size.width / 2 - 2)
    }
    
}   // #64
