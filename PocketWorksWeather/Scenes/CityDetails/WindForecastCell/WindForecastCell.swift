//
//  WindForecastCell.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class WindForecastCell: UICollectionViewCell, ConfigurableCell {
  struct ViewModel {
    var time: String
    var imageUrl: URL?
    var windInfo: NSAttributedString
  }

  // MARK: - IBOutlets:
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var weatherIconImageView: PWAsyncImageView!
  @IBOutlet weak var windInfoLabel: UILabel!

  // MARK: - View Model:
  var viewModel: ViewModel! {
    didSet {
      self.updateUI()
    }
  }

  // MARK: - View Life Cycle:
  override func awakeFromNib() {
    super.awakeFromNib()
    self.setupUI()
  }

  // MARK: - Private Funcs:
  private func setupUI() {
    self.weatherIconImageView.layer.cornerRadius = 8.0
  }

  private func updateUI() {
    self.timeLabel.text = self.viewModel.time
    if let url = self.viewModel.imageUrl {
      self.weatherIconImageView.setImage(url: url)
    } else {
      self.weatherIconImageView.cancelImageRequest()
      self.weatherIconImageView.image = nil
    }
    self.windInfoLabel.attributedText = self.viewModel.windInfo
  }
}
