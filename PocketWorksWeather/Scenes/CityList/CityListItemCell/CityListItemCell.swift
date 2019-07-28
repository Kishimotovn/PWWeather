//
//  CityListItemCell.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CityListItemCell: UITableViewCell, ConfigurableCell {
  struct ViewModel: CityListCellVM {
    var localTime: SystemDateWithOffsetLabel.ViewModel
    var cityName: String
    var windDirectionString: NSAttributedString
  }

  // MARK: - IBOutlets:
  @IBOutlet weak var localTimeLabel: SystemDateWithOffsetLabel!
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var windDirectionLabel: UILabel!

  // MARK: - ViewModel:
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
    self.selectionStyle = .none
  }

  private func updateUI() {
    self.localTimeLabel.viewModel = self.viewModel.localTime
    self.cityNameLabel.text = self.viewModel.cityName
    self.windDirectionLabel.attributedText = self.viewModel.windDirectionString
  }
}
