//
//  CitySearchResultCell.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CitySearchResultCell: UICollectionViewCell {
  struct ViewModel {
    var cityName: NSAttributedString
  }

  // MARK: - IBOutlets:
  @IBOutlet weak var cityNameLabel: UILabel!

  // MARK: - View Model:
  var viewModel: ViewModel! {
    didSet {
      self.updateUI()
    }
  }

  // MARK: - Private Funcs:
  private func updateUI() {
    self.cityNameLabel.attributedText = self.viewModel.cityName
  }
}

extension CitySearchResultCell: ConfigurableCell { }
