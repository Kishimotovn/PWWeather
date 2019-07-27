//
//  ConfigurableXib.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

protocol ConfigurableXib {
  static var xibName: String { get }
}

extension ConfigurableXib where Self: UIView {
  static var xibName: String {
    return String(describing: Self.self)
  }

  static func loadFromXib() -> Self? {
    let nib = UINib(nibName: xibName, bundle: nil)
    return nib.instantiate(withOwner: self, options: nil).first as? Self
  }
}
