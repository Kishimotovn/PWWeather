//
//  GetWeatherDataForCitiesOperation.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation
import Alamofire
import KiNetworking

class GetWeatherDataForCitiesOperation: DecodableOperation<CityWeatherListResponse> {
  public init(cityIds: [String]) {
    super.init()

    let request = PWOpenWeatherRequest(endpoint: "/group")

    let idsString = cityIds.joined(separator: ",")
    var params = Parameters()
    params["id"] = idsString
    request.parameters = params

    self.request = request

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    self.decoder = decoder
  }
}
