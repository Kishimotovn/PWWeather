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

  func windSpeedString(for unitSystem: PWUnitSystem) -> String {
    var measurement = Measurement(value: self, unit: UnitSpeed.metersPerSecond)
    switch unitSystem {
    case .imperial:
      measurement.convert(to: .milesPerHour)
    default:
      break
    }
    let formatter = MeasurementFormatter()
    formatter.unitOptions = .providedUnit
    
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 0
    
    formatter.numberFormatter = numberFormatter
    return formatter.string(from: measurement)
  }

  func visibilityString(for unitSystem: PWUnitSystem) -> String {
    var measurement = Measurement(value: self, unit: UnitLength.meters)
    switch unitSystem {
    case .imperial:
      measurement.convert(to: .miles)
    case .metric:
      measurement.convert(to: .kilometers)
    }
    let formatter = MeasurementFormatter()
    formatter.unitOptions = .providedUnit
    
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 0
    
    formatter.numberFormatter = numberFormatter
    return formatter.string(from: measurement)
  }
}
