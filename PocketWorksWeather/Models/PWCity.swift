//
//  PWCity.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

struct PWCity: Decodable {
  var id: Int
  var name: String
  var country: String
  var coord: CityCoordinatesResponse
}

extension PWCity: Equatable {
  public static func ==(lhs: PWCity, rhs: PWCity) -> Bool {
    return lhs.id == rhs.id
  }
}
