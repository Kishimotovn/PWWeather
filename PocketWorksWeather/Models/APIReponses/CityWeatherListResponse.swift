//
//  CityWeatherListResponse.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

struct CityWeatherListResponse: Decodable {
  var cnt: Int
  var list: [CityWeatherResponse]
}
