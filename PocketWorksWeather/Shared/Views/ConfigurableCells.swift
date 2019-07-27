//
//  ConfigurableCells.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
  static var identifier: String { get }
  static var nib: UINib { get }
}

extension ConfigurableCell {
  static var identifier: String {
    return String(describing: Self.self)
  }
  
  static var nib: UINib {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
}
