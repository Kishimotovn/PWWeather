//
//  PWAPIDelegate.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import Promises
import KiNetworking

class PWAPIServiceDelegate: APIServiceDelegate {
  func service(_ apiService: APIServiceProtocol, willExecute request: RequestProtocol) {
    if let openWeatherRequest = request as? PWOpenWeatherRequest {
      openWeatherRequest.authorize()
      openWeatherRequest.addUnitParams()
    }
  }

  func service(_ apiService: APIServiceProtocol, shouldHandleCode errorCode: Int, on request: RequestProtocol) -> Bool {
    return false
  }

  func service(_ apiService: APIServiceProtocol, handleResponse returnedResponse: ResponseProtocol, on request: RequestProtocol) -> Promise<ResponseProtocol> {
    return Promise(returnedResponse)
  }
}
