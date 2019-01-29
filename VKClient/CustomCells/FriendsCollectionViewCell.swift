//
//  FriendsCollectionViewCell.swift
//  VKClient
//
//  Created by Gennady Stepanov on 27/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var friendsImageView: UIImageView!
  @IBOutlet weak var likeControl: LikeControl!
  
  override func awakeFromNib() {
    //addGestureRecognizer(tapGestureRecognizer)
    friendsImageView.contentMode = .scaleAspectFill
  }
  
  lazy var tapGestureRecognizer: UITapGestureRecognizer = {
    let recognizer = UITapGestureRecognizer(target: self,
                                            action: #selector(onTap(_:)))
    recognizer.numberOfTapsRequired = 1
    recognizer.numberOfTouchesRequired = 1
    return recognizer
  }()
  
  @objc func onTap(_ sender: UIImageView) {
    ImageTapAnimations.animateImageTap(imageView: friendsImageView)
    
    
    
  }

}
