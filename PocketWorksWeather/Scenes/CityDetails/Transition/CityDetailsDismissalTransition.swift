//
//  CityDetailsDismissalTransition.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CityDetailsDismissalTransition: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: .from) as? CityDetailsViewController,
      let toVC = transitionContext.viewController(forKey: .to) as? CityListViewController,
      let selectedIndexPath = toVC.cityListTableView.indexPathForSelectedRow,
      let selectedCell = toVC.cityListTableView.cellForRow(at: selectedIndexPath),
      let cellSnapshot = selectedCell.snapshotView(afterScreenUpdates: true)
    else {
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      return
    }

    let cellRect = toVC.cityListTableView.rectForRow(at: selectedIndexPath)
    let frame = toVC.cityListTableView.convert(cellRect, to: toVC.view)

    let containerView = transitionContext.containerView

    let transitioningView = UIView(frame: fromVC.view.bounds)
    transitioningView.backgroundColor = UIColor.white

    cellSnapshot.frame = frame

    containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
    containerView.insertSubview(cellSnapshot, aboveSubview: fromVC.view)
    cellSnapshot.alpha = 0
    fromVC.view.mask = transitioningView
    
    let duration = self.transitionDuration(using: transitionContext)

    UIView.animateKeyframes(withDuration: duration,
                            delay: 0.0,
                            options: .calculationModeCubic,
                            animations: {
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                                fromVC.contentStackView.alpha = 0.0
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.8, animations: {
                                transitioningView.frame = frame
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3, animations: {
                                cellSnapshot.alpha = 1.0
                              })
    }, completion: { _ in
      fromVC.view.mask = nil
      cellSnapshot.removeFromSuperview()
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }
}
