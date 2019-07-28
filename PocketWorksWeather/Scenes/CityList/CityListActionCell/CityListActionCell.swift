//
//  CityListActionCell.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 27/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

protocol CityListActionCellDelegate: class {
  func toggleUnitSystem(to newSystem: PWUnitSystem, on cell: CityListActionCell)
  func addCityTapped(on cell: CityListActionCell)
}

class CityListActionCell: UITableViewCell, ConfigurableCell {
  struct ViewModel: CityListCellVM {
    var metricSystemButtonSelected: Bool
    var imperialSystemButtonSelected: Bool
  }

  // MARK: - IBOutlets:
  @IBOutlet weak var metricSystemButton: UIButton!
  @IBOutlet weak var imperialSystemButton: UIButton!

  // MARK: - IBActions:
  @IBAction func toggleUnitSystem(_ sender: UIButton) {
    let targetUnitSystem: PWUnitSystem
    switch sender.tag {
    case 0:
      targetUnitSystem = .metric
    default:
      targetUnitSystem = .imperial
    }
    self.delegate?.toggleUnitSystem(to: targetUnitSystem, on: self)
  }

  @IBAction func addCity() {
    self.delegate?.addCityTapped(on: self)
  }

  // MARK: - ViewModel:
  var viewModel: ViewModel! {
    didSet {
      self.updateUI()
    }
  }

  weak var delegate: CityListActionCellDelegate?

  // MARK: - View Life Cycle:
  override func awakeFromNib() {
    super.awakeFromNib()
    self.setupUI()
  }

  // MARK: - Private Funcs:
  private func setupUI() {
    self.selectionStyle = .none

    let celciusAttributedString = NSAttributedString(string: "°C")
      .applyFont(UIFont.systemFont(ofSize: 18))
      .applyForegroundColor(UIColor.white.withAlphaComponent(0.5))
    let celciusBoldAttributedString = celciusAttributedString
      .applyFont(UIFont.systemFont(ofSize: 18, weight: .bold))
      .applyForegroundColor(.white)
    
    self.metricSystemButton.setAttributedTitle(celciusAttributedString, for: .normal)
    self.metricSystemButton.setAttributedTitle(celciusBoldAttributedString, for: .selected)

    let fahrenheitAttributedString = NSAttributedString(string: "°F")
      .applyFont(UIFont.systemFont(ofSize: 18))
      .applyForegroundColor(UIColor.white.withAlphaComponent(0.5))
    let fahrenheitBoldAttributedString = fahrenheitAttributedString
      .applyFont(UIFont.systemFont(ofSize: 18, weight: .bold))
      .applyForegroundColor(.white)

    self.imperialSystemButton.setAttributedTitle(fahrenheitAttributedString, for: .normal)
    self.imperialSystemButton.setAttributedTitle(fahrenheitBoldAttributedString, for: .selected)
  }

  private func updateUI() {
    self.metricSystemButton.isSelected = self.viewModel.metricSystemButtonSelected
    self.imperialSystemButton.isSelected = self.viewModel.imperialSystemButtonSelected
  }
}
