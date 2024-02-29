//
//  CustomBorder.swift
//  UITableViewCellBorderLineSample
//
//  Created by 滝浪翔太 on 2024/02/16.
//

import UIKit

enum BorderPosition {
  case top
  case left
  case right
  case bottom
}


extension UIView {
  func addBorder(width: CGFloat, position: BorderPosition, color: UIColor) {
    let border = UIView()
    border.tag = 100
    switch position {
    case .top:
      border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
      border.backgroundColor = color
      self.addSubview(border)
    case .left:
      border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
      border.backgroundColor = color
      self.addSubview(border)
    case .right:
      border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
      border.backgroundColor = color
      self.addSubview(border)
    case .bottom:
      border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
      border.backgroundColor = color
      self.addSubview(border)
    }
  }
}


func removeBorder(view: UIView) {
  view.subviews.forEach {
    if $0.tag == 100 {
      $0.removeFromSuperview()
    }
  }
}
