//
//  StoryboardBased.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

public protocol StoryboardBased: class {
  static var storyboardName: String { get }
  static var storyboard: UIStoryboard { get }
}

public extension StoryboardBased {
  static var storyboard: UIStoryboard {
    return UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
  }
}

public extension StoryboardBased where Self: UIViewController {
  static func instantiate() -> Self {
    guard
      let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self
      else {
        fatalError("The VC of \(storyboard) is not of class \(self)")
    }
    return viewController
  }
}
