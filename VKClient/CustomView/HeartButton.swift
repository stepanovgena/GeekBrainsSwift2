//
//  HeartShapedButton.swift
//  VKClient
//
//  Created by Gennady Stepanov on 07/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HeartButton: UIButton {
  
  @IBInspectable var filled: Bool = true
  @IBInspectable var strokeWidth: CGFloat = 2.0
  @IBInspectable var strokeColor: UIColor = UIColor.gray
  
  var liked: Bool = false
  
  override func draw(_ rect: CGRect) {
    let bezierPath = UIBezierPath(heartHeight: self.bounds.height)
    
    if !liked {
      self.strokeColor.setStroke()
      self.filled = false
    } else {
      strokeColor = UIColor.red
      self.tintColor = UIColor.red
      self.strokeColor.setStroke()
      self.tintColor.setFill()
      bezierPath.fill()
    }
    bezierPath.lineWidth = self.strokeWidth
    bezierPath.stroke()
  }
}
