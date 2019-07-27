//
//  CitySearchResultCollectionFlowLayout.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CitySearchResultCollectionFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {
    super.prepare()

    self.scrollDirection = .vertical
    self.minimumLineSpacing = 0.0
    self.minimumInteritemSpacing = 16.0
    self.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)

    guard let collectionView = self.collectionView else { return }
    self.itemSize = CGSize(width: collectionView.bounds.width - 50.0, height: 50)
  }
}
