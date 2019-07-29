//
//  StubbedCityListProvider.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 29/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
@testable import PocketWorksWeather
import Promises

class StubbedCityListProvider: CityListProvider {
  var fetchCityListCalled = false
  func fetchCityList() -> Promise<[PWCity]> {
    self.fetchCityListCalled = true
    return Promise([Seed.hanoi]).delay(0.5)
  }
}
