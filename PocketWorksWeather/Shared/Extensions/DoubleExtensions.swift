//
//  DoubleExtensions.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

extension Double {
  func tempString(for unitSystem: PWUnitSystem) -> String {
    var measurement = Measurement(value: self, unit: UnitTemperature.celsius)
    switch unitSystem {
    case .imperial:
      measurement.convert(to: .fahrenheit)
    default:
      break
    }
    let formatter = MeasurementFormatter()
    formatter.unitOptions = .temperatureWithoutUnit

    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 0

    formatter.numberFormatter = numberFormatter
    return formatter.string(from: measurement)
  }
}
