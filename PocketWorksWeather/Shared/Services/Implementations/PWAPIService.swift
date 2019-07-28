//
//  PWAPIService.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import KiNetworking
import Promises

class PWAPIService: PWAPIServiceProtocol {
  let executor: APIService = {
    let delegate = PWAPIServiceDelegate()
    if let config = APIServiceConfig(base: PWEnvironment.current.apiBaseURL,
                                     commonHeaders: [:]) {
      config.debugEnabled = .response
      return APIService(config, delegate: delegate)
    }
    fatalError("API Service not configured")
  }()

  func getCityWeather(for cityIds: [String]) -> Promise<[CityWeatherResponse]> {
    return GetWeatherDataForCitiesOperation(cityIds: cityIds)
      .execute(in: self.executor)
      .then { cityListResponse in
      return cityListResponse.list
    }
  }

  func getCityWeather(for cityId: String) -> Promise<CityWeatherResponse> {
    return GetWeatherDataForCityOperation(cityId: cityId)
      .execute(in: self.executor)
  }

  func getCityWeatherForecast(for cityId: String) -> Promise<[CityWeatherResponse]> {
    return GetWeatherDataForecastForCityOperation(cityId: cityId)
      .execute(in: self.executor)
      .then { cityListResponse in
        return cityListResponse.list
    }
  }
}
