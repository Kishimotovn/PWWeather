//
//  StringExtensions.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import Foundation

extension String {
  func containsCaseInsensitive(_ subString: String) -> Bool {
    return self.lowercased().contains(subString.lowercased())
  }
}
