//
//  Seed.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
@testable import PocketWorksWeather

struct Seed {
  static let hanoiCoor = CityCoordinatesResponse(lat: 21.028511,
                                                 lon: 105.804817)
  static let hanoi = PWCity(id: 1,
                            name: "Ha Noi",
                            country: "Viet Nam",
                            coord: Seed.hanoiCoor)
}
