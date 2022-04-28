//
//  UILabel.swift
//  App Store
//
//  Created by Tiago Oliveira on 09/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

extension UILabel {
  
  static func textLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    
    label.font = UIFont.systemFont(ofSize: fontSize)
    label.numberOfLines = numberOfLines
    label.text = text
    
    return label
  }
  
  static func textboldLabel (text: String, fontSize: CGFloat, numberOfLines: Int = 1) -> UILabel {
    let label = UILabel()
    
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
    label.numberOfLines = numberOfLines
    label.text = text
    
    return label
  }
  
}
