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
  private var likesCount: Int = 0
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

    likesLabel.text = "\(likesCount)"
//debug
//  likeButton.layer.borderWidth = 1.0
//  likesLabel.layer.borderWidth = 1.0
    stackView = UIStackView(arrangedSubviews: [likeButton, likesLabel])
    let likeButtonWidthContraints =  NSLayoutConstraint(item: likeButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 22)
    NSLayoutConstraint.activate([likeButtonWidthContraints])
    let likeButtonHeightContraints =  NSLayoutConstraint(item: likeButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 22)
    NSLayoutConstraint.activate([likeButtonWidthContraints, likeButtonHeightContraints])
    let likeElementsEqualHeightContraints =  NSLayoutConstraint(item: likesLabel, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: likeButton, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0.0)
    NSLayoutConstraint.activate([likeButtonWidthContraints, likeButtonHeightContraints, likeElementsEqualHeightContraints])
    
    self.addSubview(stackView)
    stackView.spacing = 2
    stackView.distribution = .fillProportionally
    stackView.alignment = .fill
    
    addGestureRecognizer(tapGestureRecognizer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    stackView.frame = bounds
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
  
  //Help needed: tap works only with UILabel item of the stackView
  @objc func onTap(_ sender: HeartButton) {
    like()
  }
}
