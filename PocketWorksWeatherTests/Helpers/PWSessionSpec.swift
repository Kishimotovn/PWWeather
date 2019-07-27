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
    var sut: PWSession = PWSession.shared

    describe("PocketWorksWeather Session") {
      context("should initialize with cities list filled") {
        it("city list should be included with the bundle") {
          expect(sut.cityList).toNot(beEmpty())
        }
      }
    }
  }
}
