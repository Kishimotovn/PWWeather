//
//  CityDetailsTransitionDelegate.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CityDetailsTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return CityDetailsDismissalTransition()
  }

  func animationController(forPresented presented: UIViewController,
                           presenting: UIViewController,
                           source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return CityDetailsPresentationTransition()
  }
}
