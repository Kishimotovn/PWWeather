//
//  PWAsyncImageView.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class PWAsyncImageView: UIImageView {
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

  private var currentImageRequest: URLSessionDataTask?

  var isDownloadingImage: Bool {
    return self.currentImageRequest != nil
  }

  func setImage(url: URL) {
    self.cancelImageRequest()
    self.image = nil

    let session = URLSession.shared
    session.configuration.urlCache = URLCache.init(memoryCapacity: 1000000, diskCapacity: 1000000, diskPath: nil)
    session.configuration.requestCachePolicy = .reloadRevalidatingCacheData

    self.activityIndicator?.startAnimating()
    self.currentImageRequest = session.dataTask(with: url, completionHandler: { [weak self] (data, response, error) in
      DispatchQueue.main.async {
        self?.activityIndicator?.stopAnimating()
        guard let requestURL = self?.currentImageRequest?.originalRequest?.url, requestURL.absoluteString == url.absoluteString else {
          return
        }
        
        if let data = data, let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
        
        self?.currentImageRequest = nil
      }
    })

    self.currentImageRequest?.resume()
  }
  
  func cancelImageRequest() {
    self.currentImageRequest?.cancel()
    self.currentImageRequest = nil
  }
}
