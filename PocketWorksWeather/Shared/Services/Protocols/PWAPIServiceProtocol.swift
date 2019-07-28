//
//  PWAPIServiceProtocol.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import Promises

protocol PWAPIServiceProtocol {
  func getCityWeather(for cityIds: [String]) -> Promise<[CityWeatherResponse]>
  func getCityWeather(for cityId: String) -> Promise<CityWeatherResponse>
}
