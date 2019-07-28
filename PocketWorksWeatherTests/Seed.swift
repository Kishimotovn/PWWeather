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
  static let hanoiCoor = CityCoordinatesResponse(lat: 21.02,
                                                 lon: 105.84)
  static let hanoi = PWCity(id: 1581130,
                            name: "Ha Noi",
                            country: "Viet Nam",
                            coord: Seed.hanoiCoor)
  static let hanoiWeatherData = CityWeatherResponse(
    coord: Seed.hanoiCoor,
    weather: [Seed.hanoiWeather],
    main: Seed.main,
    visibility: 10000,
    wind: Seed.wind,
    clouds: Seed.clouds,
    dt: Date(timeIntervalSince1970: 1564326552),
    sys: Seed.sys,
    id: 1581130,
    name: "Ha Noi")
  
  static let hanoiWeather = WeatherResponse(
    id: 800,
    main: "Clear",
    description: "clear sky",
    icon: "01n")

  static let main = CityWeatherMainResponse(
    temp: 30,
    pressure: 1004,
    humidity: 74,
    tempMin: 30,
    tempMax: 30)

  static let wind = CityWindResponse(
    speed: 4.6,
    deg: 110)

  static let clouds = CityCloudsResponse(all: 0)

  static let sys = CitySysResponse(
    country: "VN",
    timezone: 25200,
    sunrise: Date(timeIntervalSince1970: 1564266516),
    sunset: Date(timeIntervalSince1970: 1564313846)
  )
}
