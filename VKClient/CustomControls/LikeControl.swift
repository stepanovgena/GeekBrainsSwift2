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
  private var stackView: UIStackView!
  private var likeButton = HeartButton()
  private let likesLabel = UILabel()
  private var likesCount: Int = 155
  private var liked: Bool = false

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupView()
  }

  private func setupView() {
    likeButton.isUserInteractionEnabled = false
    likesLabel.text = "\(likesCount)"
    likesLabel.textColor = UIColor.darkGray
    setupConstraints()
   
    //MARK: to debug LikeControl position uncomment two lines below
//    likeButton.layer.borderWidth = 1.0
//    likesLabel.layer.borderWidth = 1.0
    
    stackView = UIStackView(arrangedSubviews: [likeButton, likesLabel])
    self.addSubview(stackView)
    stackView.distribution = .fillEqually
    addGestureRecognizer(tapGestureRecognizer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    stackView.frame = bounds
  }
  
  func setupConstraints() {
    likesLabel.heightAnchor.constraint(equalTo: likeButton.heightAnchor, multiplier: 1)
  }
  
  func incrementLikesCount() {
    likesCount += 1
    updateLikesCount(likes: likesCount)
  }

  func decrementLikesCount() {
    likesCount -= 1
    updateLikesCount(likes: likesCount)
  }
  
  func updateLikesCount(likes: Int) {
    likesCount = likes
    likesLabel.text = "\(likesCount)"
  }
  
  func like() {
    if !liked {
    likeButton.liked = true
    likeButton.setNeedsDisplay()
    incrementLikesCount()
    liked = true
    } else {
      likeButton.liked = false
      likeButton.setNeedsDisplay()
      decrementLikesCount()
      liked = false
    }
  }
  
  lazy var tapGestureRecognizer: UITapGestureRecognizer = {
    let recognizer = UITapGestureRecognizer(target: self,
                                            action: #selector(onTap(_:)))
    recognizer.numberOfTapsRequired = 1
    recognizer.numberOfTouchesRequired = 1
    return recognizer
  }()
  
  @objc func onTap(_ sender: HeartButton) {
    like()
  }
}
