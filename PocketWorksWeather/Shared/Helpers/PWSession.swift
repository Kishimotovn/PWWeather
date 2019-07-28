//
//  PWSession.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import KiNetworking
import Promises

class PWSession {
  static let shared = PWSession()
  private init() {
    _ = self.fetchCityList()
  }

  let apiService: PWAPIService = PWAPIService()
  var cachedCityList: [PWCity] = []
  var unitSystem: PWUnitSystem {
    get {
      return PWUnitSystem(rawValue: PWUserKey.unitType.value() ?? "") ?? .metric
    }
    set {
      PWUserKey.unitType.set(newValue.rawValue)
    }
  }
}

extension PWSession: CityListProvider {
  func fetchCityList() -> Promise<[PWCity]> {
    if !self.cachedCityList.isEmpty {
      return Promise(self.cachedCityList)
    } else {
      return Promise<[PWCity]>(on: DispatchQueue.global(qos: .userInteractive)) { fullfill, reject in
        let started = Date()
        let decoder = JSONDecoder()
        guard
          let url = Bundle.main.url(forResource: "cityList", withExtension: "json")
        else {
          fullfill([])
          return
        }
        
        let data = try Data(contentsOf: url)
        let list = try decoder.decode([PWCity].self, from: data)

        self.cachedCityList = list
        fullfill(list)
        print("finish after: \(Date().timeIntervalSince(started))")
      }.recover { error -> [PWCity] in
        print(error)
        return []
      }
    }
  }
}

protocol CityListProvider {
  func fetchCityList() -> Promise<[PWCity]>
}
