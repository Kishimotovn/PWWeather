//
//  PWEnvironment.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import KiNetworking

enum PWEnvironment: String {
  case dev
  case production
  
  static let current: PWEnvironment = {
    if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
      if configuration.lowercased().range(of: "dev") != nil {
        return .dev
      }
    }
    return .production
  }()

  var apiBaseURL: String {
    switch self {
    case .dev:
      return "http://api.openweathermap.org/data/2.5"
    case .production:
      return "http://api.openweathermap.org/data/2.5"
    }
  }

  var apiKey: String {
    switch self {
    case .dev:
      return "18c80d238ec03ee72c5805687328da44"
    case .production:
      return "18c80d238ec03ee72c5805687328da44"
    }
  }
}
