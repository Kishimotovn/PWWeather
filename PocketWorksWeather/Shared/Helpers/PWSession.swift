//
//  PWSession.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import KiNetworking

class PWSession {
  static let shared = PWSession()
  private init() { }

  let apiService: PWAPIService = PWAPIService()
  let cityList: [PWCity] = {
    let decoder = JSONDecoder()
    guard
      let url = Bundle.main.url(forResource: "cityList", withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let list = try? decoder.decode([PWCity].self, from: data)
    else {
      return []
    }

    return list
  }()
}
