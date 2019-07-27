//
//  PWUnit.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

enum PWUnit: String {
  static var current: PWUnit {
    return PWUnit(rawValue: PWUserKey.unitType.value() ?? "") ?? .metric
  }

  case metric
  case imperial
}
