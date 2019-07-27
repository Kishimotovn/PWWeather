//
//  StringExtensionsSpec.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Quick
import Nimble
@testable import PocketWorksWeather

class StringExtensionsSpec: QuickSpec {
  override func spec() {
    var sut: String!

    describe("PocketWorksWeather String Extensions") {
      context("when checking if contain substring with case insensitive") {
        it("should return true if contains substring") {
          sut = "some string"
          let substring = "some"

          expect(sut.containsCaseInsensitive(substring)).to(beTrue())
          
          let subStringDifferentCase = "Some"
          expect(sut.containsCaseInsensitive(subStringDifferentCase)).to(beTrue())
        }
        
        it("should return false if not contain substring") {
          sut = "some string"
          let substring = "some1"
          
          expect(sut.containsCaseInsensitive(substring)).to(beFalse())
          
          let subStringDifferentCase = "Some1"
          expect(sut.containsCaseInsensitive(subStringDifferentCase)).to(beFalse())
        }
      }
    }
  }
}
