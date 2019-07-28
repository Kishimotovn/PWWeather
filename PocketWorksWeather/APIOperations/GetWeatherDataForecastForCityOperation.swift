//
//  GetWeatherDataForecastForCityOperation.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import Alamofire
import KiNetworking

class GetWeatherDataForecastForCityOperation: DecodableOperation<CityWeatherListResponse> {
  public init(cityId: String) {
    super.init()
    
    let request = PWOpenWeatherRequest(endpoint: "/forecast")
    
    var params = Parameters()
    params["id"] = cityId
    request.parameters = params
    
    self.request = request
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    self.decoder = decoder
  }
}
