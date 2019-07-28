//
//  RouteDataBased.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

protocol RouteDataBased: StoryboardBased {
  associatedtype RouteData
  func configure(with passedData: RouteData)
}

extension RouteDataBased where Self: UIViewController {
  static func route(with routeData: RouteData? = nil) -> Self {
    let viewController = instantiate()
    if let data = routeData {
      viewController.configure(with: data)
    }
    return viewController
  }
}
