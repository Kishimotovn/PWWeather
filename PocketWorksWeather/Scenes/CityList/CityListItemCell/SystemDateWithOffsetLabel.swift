//
//  SystemDateWithOffsetLabel.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class SystemDateWithOffsetLabel: UILabel {
  struct ViewModel {
    var dateFormat: String
    var timezoneOffset: Double
  }

  // MARK: - ViewModel:
  var viewModel = ViewModel(dateFormat: "HH:mm",
                            timezoneOffset: 0.0) {
    didSet {
      self.dateFormatter.dateFormat = self.viewModel.dateFormat
      self.updateText()
    }
  }

  private lazy var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    dateFormatter.dateFormat = self.viewModel.dateFormat
    return dateFormatter
  }()
  private var timer: Timer?

  // MARK: - View Life Cycle:
  override func awakeFromNib() {
    super.awakeFromNib()
    self.setupTimer()
  }

  deinit {
    self.timer?.invalidate()
    self.timer = nil
  }

  // MARK: - Private Funcs:
  private func setupTimer() {
    self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      self.updateText()
    }
  }

  private func updateText() {
    let localTime = Date().addingTimeInterval(self.viewModel.timezoneOffset)
    self.text = self.dateFormatter.string(from: localTime)
  }
}
