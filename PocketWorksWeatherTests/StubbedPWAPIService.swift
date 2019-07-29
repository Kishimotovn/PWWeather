//
//  StubbedPWAPIService.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 29/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
@testable import PocketWorksWeather
import Promises

class StubbedPWAPIService: PWAPIServiceProtocol {
  var getCityWeatherForCitiesCalled = false
  var getCityWeatherForecastForCityCalled = false
  var getCityWeatherForCityCalled = false

  var error: Error?

  init(error: Error? = nil) {
    self.error = error
  }

  func getCityWeather(for cityIds: [String]) -> Promise<[CityWeatherResponse]> {
    self.getCityWeatherForCitiesCalled = true
    if let error = error {
      return Promise(error).delay(0.5)
    }
    return Promise([Seed.hanoiWeatherData]).delay(0.5)
  }
  
  func getCityWeatherForecast(for cityId: String) -> Promise<[CityWeatherResponse]> {
    self.getCityWeatherForecastForCityCalled = true
    if let error = error {
      return Promise(error).delay(0.5)
    }
    return Promise([Seed.hanoiWeatherData]).delay(0.5)
  }
  
  func getCityWeather(for cityId: String) -> Promise<CityWeatherResponse> {
    self.getCityWeatherForCityCalled = true
    if let error = error {
      return Promise(error).delay(0.5)
    }
    return Promise(Seed.hanoiWeatherData).delay(0.5)
  }
}
