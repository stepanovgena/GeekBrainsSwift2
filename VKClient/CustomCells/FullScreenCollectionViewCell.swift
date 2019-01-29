//
//  FullScreenCollectionViewCell.swift
//  VKClient
//
//  Created by Gennady Stepanov on 27/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var friendsImageView: UIImageView!
  
  override func awakeFromNib() {
    //addGestureRecognizer(tapGestureRecognizer)
    friendsImageView.contentMode = .scaleAspectFit
  }
  
}
