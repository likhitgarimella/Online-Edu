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
    
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
    }
    
    private func configureVideo() {
        
        guard let model = model else { return }
        guard let path = Bundle.main.path(forResource: model.videoFileName, ofType: model.videoFileFormat) else { return }
        
        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        let playerView = AVPlayerLayer()
        playerView.player = player
        playerView.frame = contentView.bounds
        playerView.videoGravity = .resizeAspectFill
        contentView.layer.addSublayer(playerView)
        player?.volume = 1000
        player?.play()
        
    }
    
    public func configure(with model: VideoModel) {
        
        self.model = model
        configureVideo()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}   // #55
