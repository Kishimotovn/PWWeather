//
//  NSAttributedStringExtensions.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

extension NSAttributedString {
  func applyForegroundColor(_ color: UIColor) -> NSAttributedString {
    let copy = NSMutableAttributedString(attributedString: self)
    copy.addAttribute(.foregroundColor,
                      value: color,
                      range: NSRange(location: 0, length: self.string.count))
    return copy
  }

  func applyFont(_ font: UIFont) -> NSAttributedString {
    let copy = NSMutableAttributedString(attributedString: self)
    copy.addAttribute(.font,
                      value: font,
                      range: NSRange(location: 0, length: self.string.count))
    return copy
  }
}
