//
//  VideoCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/08/21.
//

import UIKit
import AVFoundation

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    // Subviews
    var player: AVPlayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configure(with model: VideoModel) {
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}   // #31
