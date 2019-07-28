//
//  CityWeatherResponse.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

struct CityWeatherResponse: Decodable {
  var coord: CityCoordinatesResponse?
  var weather: [WeatherResponse]?
  var main: CityWeatherMainResponse?
  var visibility: Double?
  var wind: CityWindResponse?
  var clouds: CityCloudsResponse?
  var dt: Int?
  var sys: CitySysResponse?
  var id: Int?
  var name: String?
}

extension CityWeatherResponse: Equatable {
  public static func ==(lhs: CityWeatherResponse, rhs: CityWeatherResponse) -> Bool {
    return lhs.id == rhs.id
  }
}

struct CityCoordinatesResponse: Decodable {
  var lat: Double
  var lon: Double
}

struct WeatherResponse: Decodable {
  var id: Int?
  var main: String?
  var description: String?
  var icon: String?
}

struct CityWeatherMainResponse: Decodable {
  var temp: Double?
  var pressure: Double?
  var humidity: Double?
  var tempMin: Double?
  var tempMax: Double?
}

struct CityWindResponse: Decodable {
  var speed: Double?
  var deg: Double?
}

struct CityCloudsResponse: Decodable {
  var all: Int?
}

struct CitySysResponse: Decodable {
  var country: String?
  var timezone: Double?
  var sunrise: Date?
  var sunset: Date?
}
