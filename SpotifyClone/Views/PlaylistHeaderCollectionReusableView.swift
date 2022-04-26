//
//  PlaylistHeaderCollectionReusableView.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 25/04/22.
//

import UIKit
import SDWebImage

final class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
   static let identifier: String = "PlaylistHeaderCollectionReusableView"
   
   private let nameLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 22, weight: .semibold)
      return label
   }()
   
   private let descriptionLabel: UILabel = {
      let label = UILabel()
      label.textColor = .secondaryLabel
      label.font = .systemFont(ofSize: 18, weight: .regular)
      label.numberOfLines = 0
      return label
   }()
   
   private let ownerLabel: UILabel = {
      let label = UILabel()
      label.textColor = .secondaryLabel
      label.font = .systemFont(ofSize: 18, weight: .light)
      return label
   }()
   
   private let imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
      imageView.image = UIImage(systemName: "photo")
      return imageView
   }()
   
   // MARK: - Init
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = .systemBackground
      addSubview(imageView)
      addSubview(nameLabel)
      addSubview(descriptionLabel)
      addSubview(ownerLabel)
   }
   
   required init?(coder: NSCoder) {
      fatalError()
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      let imageSize: CGFloat = height/1.8
      imageView.frame = CGRect(x: (width-imageSize)/2, y: 20, width: imageSize, height: imageSize)
      
      nameLabel.frame = CGRect(x: 10, y: imageView.bottom, width: width-20, height: 44)
      descriptionLabel.frame = CGRect(x: 10, y: nameLabel.bottom, width: width-20, height: 44)
      ownerLabel.frame = CGRect(x: 10, y: descriptionLabel.bottom, width: width-20, height: 44)
      
   }
   
   func configure(with viewModel: PlaylistHeaderViewViewModel) {
      nameLabel.text = viewModel.name
      ownerLabel.text = viewModel.ownerName
      descriptionLabel.text = viewModel.description
      imageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
   }
        
}
