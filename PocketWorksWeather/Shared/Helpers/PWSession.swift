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

  let apiService: APIService? = {
    let config = APIServiceConfig(base: PWEnvironment.current.apiBaseURL,
                                  commonHeaders: [:])
    return APIService(config, delegate: nil)
  }()
}
