//
//  VideoCollectionViewCell.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/08/21.
//

import UIKit
import AVFoundation

protocol VideoCollectionViewCellDelegate: AnyObject {
    func didTapProfileButton(with model: VideoModel)
    func didTapLikeButton(with model: VideoModel)
    func didTapCommentButton(with model: VideoModel)
    func didTapShareButton(with model: VideoModel)
}

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "VideoCollectionViewCell"
    
    // Labels
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.text = "@likhitgarimella"
        return label
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.text = "I love Friends!"
        return label
    }()
    private let audioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Chandler Bing Sarcasm"
        return label
    }()
    
    // Buttons
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        return button
    }()
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "likeIcon"), for: .normal)
        return button
    }()
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "commentIcon"), for: .normal)
        return button
    }()
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "shareIcon"), for: .normal)
        return button
    }()
    
    private let videoContainer = UIView()
    
    // Delegate
    weak var delegate: VideoCollectionViewCellDelegate?
    
    // Subviews
    var player: AVPlayer?
    
    private var model: VideoModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        contentView.clipsToBounds = true
        addSubviews()
    }
    
    private func addSubviews() {
        
        contentView.addSubview(videoContainer)
        
        contentView.addSubview(usernameLabel)
        contentView.addSubview(captionLabel)
        contentView.addSubview(audioLabel)
        
        contentView.addSubview(profileButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        
        // Add button actions
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchDown)
        likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchDown)
        commentButton.addTarget(self, action: #selector(didTapCommentButton), for: .touchDown)
        shareButton.addTarget(self, action: #selector(didTapShareButton), for: .touchDown)
        
        videoContainer.clipsToBounds = true
        
        contentView.sendSubviewToBack(videoContainer)
        
    }
    
    // Button selector functions
    @objc private func didTapProfileButton() {
        guard let model = model else { return }
        delegate?.didTapProfileButton(with: model)
    }
    
    @objc private func didTapLikeButton() {
        guard let model = model else { return }
        delegate?.didTapLikeButton(with: model)
    }
    
    @objc private func didTapCommentButton() {
        guard let model = model else { return }
        delegate?.didTapCommentButton(with: model)
    }
    
    @objc private func didTapShareButton() {
        guard let model = model else { return }
        delegate?.didTapShareButton(with: model)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        videoContainer.frame = contentView.bounds
        
        let size = contentView.frame.size.width/12
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height - 100
        
        // Buttons
        shareButton.frame = CGRect(x: width-size-20, y: height-size-60, width: size, height: size)
        commentButton.frame = CGRect(x: width-size-20, y: height-(size*2)-90, width: size, height: size)
        likeButton.frame = CGRect(x: width-size-20, y: height-(size*3)-120, width: size, height: size)
        profileButton.frame = CGRect(x: width-size-24, y: height-(size*4)-154, width: size+8, height: size+8)
        profileButton.tintColor = UIColor.white
        
        // Labels
        usernameLabel.frame = CGRect(x: 8, y: height-160, width: width-size-10, height: 40)
        captionLabel.frame = CGRect(x: 8, y: height-120, width: width-size-10, height: 40)
        audioLabel.frame = CGRect(x: 8, y: height-80, width: width-size-10, height: 40)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Labels
        usernameLabel.text = nil
        captionLabel.text = nil
        audioLabel.text = nil
        
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
        videoContainer.layer.addSublayer(playerView)
        player?.volume = 1000
        player?.play()
        
        if player!.rate > 0
        {
            player!.pause()
            player = nil
        }
        
    }
    
    public func configure(with model: VideoModel) {
        
        self.model = model
        configureVideo()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}   // #198
