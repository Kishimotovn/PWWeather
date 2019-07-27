//
//  PWAPIServiceTests.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Quick
import KiNetworking
import Nimble
@testable import PocketWorksWeather

class PWAPIServiceSpec: QuickSpec {
  override func spec() {
    var sut: PWAPIService!

    describe("PocketWorksWeather API Service") {
      context("can request multiple weather data with city ids") {
        afterEach {
          sut = nil
        }

        beforeEach {
          sut = PWAPIService()
        }

        it("should return weather data if ids are valid") {
          let cityIds = ["524901","703448","2643743"]

          waitUntil(timeout: 3.0) { done in
            sut.getCityWeather(for: cityIds).then { list in
              expect(list.count).to(equal(3))
              done()
            }
          }
        }

        it("should reject with error if id is not valid") {
          let cityIds = ["someRandomId"]
          
          waitUntil(timeout: 3.0) { done in
            sut.getCityWeather(for: cityIds).then { list in
              expect(list.count).to(equal(3))
              done()
            }.catch { error in
              expect(error).to(matchError(APIError.self))
              print(error.localizedDescription)
              done()
            }
          }
        }
      }
    }
  }
}
