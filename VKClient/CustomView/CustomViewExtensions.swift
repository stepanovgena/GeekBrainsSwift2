//
//  CustomViewExtensions.swift
//  VKClient
//
//  Created by Gennady Stepanov on 07/01/2019.
//  Copyright © 2019 Gennady Stepanov. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
  convenience init(heartHeight rectHeight: CGFloat) {
    self.init()
    
    //Calculate Radius of Arcs using Pythagoras
    let sideOne = rectHeight * 0.4
    let sideTwo = rectHeight * 0.3
    let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
    
    //Left Hand Curve
    self.addArc(withCenter: CGPoint(x: rectHeight * 0.3, y: rectHeight * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
    //Right Hand Curve
    self.addArc(withCenter: CGPoint(x: rectHeight * 0.7, y: rectHeight * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
    
    //Right Bottom Line
    self.addLine(to: CGPoint(x: rectHeight * 0.5, y: rectHeight * 0.95))
    
    //Left Bottom Line
    self.close()
  }
}

extension Int {
  var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

extension String {
  subscript (i: Int) -> Character {
    return self[index(startIndex, offsetBy: i)]
  }
}

