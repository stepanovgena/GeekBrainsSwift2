//
//  CircularImageView.swift
//  VKClient
//
//  Created by Gennady Stepanov on 26/12/2018.
//  Copyright © 2018 Gennady Stepanov. All rights reserved.
//

import Foundation

import UIKit
//Doesn't work yet
//TODO: fix
@IBDesignable class CircularImageView: UIImageView {
  
  @IBInspectable var cornerRadius: CGFloat {
    return frame.width/2
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }
  
  override func prepareForInterfaceBuilder() {
    sharedInit()
  }
  
  func sharedInit() {
    refreshCorners(value: cornerRadius)
  }
  
  func refreshCorners(value: CGFloat) {
    layer.cornerRadius = value
  }
}
