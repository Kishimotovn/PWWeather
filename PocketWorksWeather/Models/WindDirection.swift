//
//  WindDirection.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

enum WindDirection: String, CaseIterable {
  case n, nne, ne, ene, e, ese, se, sse, s, ssw, sw, wsw, w, wnw, nw, nnw

  init(_ direction: Double) {
    let index = Int((direction + 11.25).truncatingRemainder(dividingBy: 360) / 22.5)
    self = WindDirection.allCases[index]
  }
}

extension WindDirection: CustomStringConvertible  {
  var description: String {
    return self.rawValue.uppercased()
  }
}
