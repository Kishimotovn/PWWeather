//
//  CityDetailsForecastsCollectionFlowLayout.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CityDetailsForecastsCollectionFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {
    super.prepare()

    self.scrollDirection = .horizontal
    self.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    self.minimumLineSpacing = 8
    self.minimumInteritemSpacing = 0

    guard let collectionView = self.collectionView else {
      return
    }

    self.itemSize = CGSize(width: 100, height: collectionView.bounds.height)
  }
}
