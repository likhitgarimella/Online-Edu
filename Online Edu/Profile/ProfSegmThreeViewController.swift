//
//  ProfSegmThreeViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 24/09/21.
//

import UIKit

class ProfSegmThreeViewController: UIViewController {
    
    @IBOutlet var profSegmCollectionView: UICollectionView!
    
    /// images in coll view
    var items = [UIImage(named: "profSegThree1"), UIImage(named: "profSegThree2"), UIImage(named: "profSegThree3"), UIImage(named: "profSegThree1"), UIImage(named: "profSegThree2"), UIImage(named: "profSegThree3"), UIImage(named: "profSegThree1"), UIImage(named: "profSegThree2"), UIImage(named: "profSegThree3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profSegmCollectionView.backgroundColor = UIColor.white
        
        profSegmCollectionView.dataSource = self
        profSegmCollectionView.delegate = self
        
    }
    
}

extension ProfSegmThreeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// static
        return (items.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmThreeCollectionViewCell", for: indexPath) as! SegmThreeCollectionViewCell
        cell.indexLbl.text = String((indexPath.row)+1)
        cell.profSegmImg.image = items[indexPath.row]
        return cell
        
    }
    
}

extension ProfSegmThreeViewController: UICollectionViewDelegateFlowLayout {
    
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
    
}   // #66
