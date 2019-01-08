//
//  LikeControl.swift
//  VKClient
//
//  Created by Gennady Stepanov on 08/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class LikeControl: UIControl {
   var stackView: UIStackView!
   var likeButton = HeartButton()
 // var likesLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
  }

  private func setupView() {
    let likesLabel = UILabel()
    likesLabel.text = "1"
    stackView = UIStackView(arrangedSubviews: [likeButton, likesLabel])
    
    self.addSubview(stackView)
    
    stackView.spacing = 16
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
   stackView.frame = bounds
  }

  
}
