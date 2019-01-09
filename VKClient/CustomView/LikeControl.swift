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
  let likesLabel = UILabel()
  var likesCount: Int = 0

  
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
//    likeButton.layer.borderWidth = 1.0
//    likesLabel.layer.borderWidth = 1.0
    stackView = UIStackView(arrangedSubviews: [likeButton, likesLabel])
    let likeButtonWidthContraints =  NSLayoutConstraint(item: likeButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 22)
    NSLayoutConstraint.activate([likeButtonWidthContraints])
    let likeButtonHeightContraints =  NSLayoutConstraint(item: likeButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 22)
    NSLayoutConstraint.activate([likeButtonWidthContraints, likeButtonHeightContraints])
    
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
  
//  @objc override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    incrementLikesCount()
//  }
//  @objc override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
//    <#code#>
//  }
  
  lazy var tapGestureRecognizer: UITapGestureRecognizer = {
    let recognizer = UITapGestureRecognizer(target: self,
                                            action: #selector(onTap))
    recognizer.numberOfTapsRequired = 1    // Количество нажатий, необходимое для распознавания
    recognizer.numberOfTouchesRequired = 1 // Количество пальцев, которые должны коснуться экрана для распознавания
    return recognizer
    
  }()
  
  @objc func onTap() {
    incrementLikesCount()
  }
  
}
