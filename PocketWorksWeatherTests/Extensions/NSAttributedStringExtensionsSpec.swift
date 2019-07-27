//
//  NSAttributedStringExtensionsSpec.swift
//  PocketWorksWeatherTests
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Quick
import Nimble
@testable import PocketWorksWeather

class NSAttributedStringExtensionsSpec: QuickSpec {
  override func spec() {
    var sut: NSAttributedString!
    
    describe("PocketWorksWeather NSAttributedString Extensions") {
      context("when applying foreground color to an nsattributed string") {
        it("should apply new color to the whole string") {
          let originalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
          ]
          let originalString = NSAttributedString(string: "some string", attributes: originalAttributes)

          sut = originalString.applyForegroundColor(.red)
          
          sut.enumerateAttribute(.foregroundColor, in: NSRange(location: 0, length: sut.length), options: []) { value, _, _ in
            expect(value).to(be(UIColor.red))
          }
        }
      }

      context("when applying font to an nsattributed string") {
        it("should apply new font to the whole string") {
          let originalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18)
          ]
          let originalString = NSAttributedString(string: "some string", attributes: originalAttributes)
          
          sut = originalString.applyFont(UIFont.systemFont(ofSize: 30))
          
          sut.enumerateAttribute(.font, in: NSRange(location: 0, length: sut.length), options: []) { value, _, _ in
            expect(value).to(be(UIFont.systemFont(ofSize: 30)))
          }
        }
      }
    }
  }
}

