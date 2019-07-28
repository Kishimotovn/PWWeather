//
//  PWUserKey.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

enum PWUserKey: String {
  case unitType
  case cityIdList

  func value<T>() -> T? {
    return UserDefaults.standard.value(forKey: self.rawValue) as? T
  }

  func set(_ newValue: Any?) {
    UserDefaults.standard.set(newValue, forKey: self.rawValue)
  }
}
