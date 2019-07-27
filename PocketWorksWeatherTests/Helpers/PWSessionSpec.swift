//
//  PWSessionSpec.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Quick
import Nimble
@testable import PocketWorksWeather

class PWSessionSpec: QuickSpec {
  override func spec() {
    let sut: PWSession = PWSession.shared

    describe("PocketWorksWeather Session") {
      context("should initialize with cities list cached") {
        it("should have cached city list ready") {
          expect(sut.cachedCityList).toEventuallyNot(beEmpty(), timeout: 5.0)
        }
      }
    }
  }
}
