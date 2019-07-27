//
//  PWRequest.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import KiNetworking
import Alamofire
import Promises

class PWOpenWeatherRequest: KiNetworking.Request {
  func authorize() {
    if self.parameters == nil {
      self.parameters = Parameters()
    }
    self.parameters?["APPID"] = PWEnvironment.current.apiKey
  }

  func addUnitParams() {
    if self.parameters == nil {
      self.parameters = Parameters()
    }
    self.parameters?["unit"] = PWUnit.current
  }
}
