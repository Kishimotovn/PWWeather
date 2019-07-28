//
//  UIViewControllerExtensions.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

extension UIViewController {
  func alert(title: String, message: String, actionTitle: String? = nil, action: (() -> Void)?) {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: actionTitle ?? "Ok",
                               style: .default) { _ in
      action?()
    }
    alertVC.addAction(action)
    self.present(alertVC, animated: true, completion: nil)
  }
}
