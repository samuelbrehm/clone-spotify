//
//  GenreCollectionViewCell.swift
//  SpotifyClone
//
//  Created by Samuel Brehm on 02/07/22.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
   static let identifier: String = "GenreCollectionViewCell"
   
   private let imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFit
      imageView.tintColor = .white
      imageView.image = UIImage(systemName: "music.quarternote.3",
                                withConfiguration: UIImage.SymbolConfiguration(
                                 pointSize: 50, weight: .regular))
      return imageView
   }()
   
   private let label: UILabel = {
      let label = UILabel()
      label.textColor = .white
      label.font = .systemFont(ofSize: 22, weight: .semibold)
      return label
   }()
   
   private let colors: [UIColor] = [
      .systemPink,
      .systemGreen,
      .systemPurple,
      .systemBlue,
      .systemOrange,
      .systemYellow,
      .systemRed,
      .systemGray,
      .systemMint,
      .systemTeal
   ]
   
   override init(frame: CGRect) {
      super.init(frame: frame)

      contentView.layer.cornerRadius = 8
      contentView.layer.masksToBounds = true
      contentView.addSubview(label)
      contentView.addSubview(imageView)
      
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      label.text = nil
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      
      label.frame = CGRect(x: 10,
                           y: contentView.height / 2,
                           width: contentView.width - 20,
                           height: contentView.height / 2
      )
      
      imageView.frame = CGRect(x: contentView.width / 2,
                               y: 0,
                               width: contentView.width / 2,
                               height: contentView.height / 2
      )
   }
    
   func configure(with title: String) {
      label.text = title
      contentView.backgroundColor = colors.randomElement()
   }
}
