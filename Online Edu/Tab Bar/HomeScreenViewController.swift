//
//  HomeScreenViewController.swift
//  Online Edu
//
//  Created by Likhit Garimella on 27/08/21.
//

import UIKit

struct VideoModel {
    let caption: String
    let username: String
    let audioTrackName: String
    let videoFileName: String
    let videoFileFormat: String
}

class HomeScreenViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    private var data = [VideoModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            let model = VideoModel(caption: "This is fascinating!", username: "@likhitgarimella", audioTrackName: "Linkin Park", videoFileName: "video", videoFileFormat: "mp4")
            data.append(model)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.identifier)
        collectionView?.isPagingEnabled = true
        collectionView?.dataSource = self
        view.addSubview(collectionView!)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, VideoCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.identifier, for: indexPath) as! VideoCollectionViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func didTapProfileButton(with model: VideoModel) {
        print("Profile button tapped")
    }
    
    func didTapLikeButton(with model: VideoModel) {
        print("Like button tapped")
    }
    
    func didTapCommentButton(with model: VideoModel) {
        print("Comment button tapped")
    }
    
    func didTapShareButton(with model: VideoModel) {
        print("Share button tapped")
    }
    
}   // #82
