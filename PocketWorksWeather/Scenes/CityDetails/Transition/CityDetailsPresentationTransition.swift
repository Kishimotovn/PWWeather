//
//  CityDetailsPresentationTransition.swift
//  PocketWorksWeather
//
//  Created by Anh Phan Tran on 28/07/2019.
//  Copyright © 2019 Anh Phan Tran. All rights reserved.
//

import UIKit

class CityDetailsPresentationTransition: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: .from) as? CityListViewController,
      let toVC = transitionContext.viewController(forKey: .to) as? CityDetailsViewController,
      let selectedIndexPath = fromVC.cityListTableView.indexPathForSelectedRow,
      let selectedCell = fromVC.cityListTableView.cellForRow(at: selectedIndexPath),
      let cellSnapshot = selectedCell.snapshotView(afterScreenUpdates: true)
    else {
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
      return
    }

    let cellRect = fromVC.cityListTableView.rectForRow(at: selectedIndexPath)
    let frame = fromVC.cityListTableView.convert(cellRect,
                                                 to: fromVC.view)

    cellSnapshot.frame = frame
    toVC.contentStackView.alpha = 0.0
    
    let containerView = transitionContext.containerView
    let finalFrame = transitionContext.finalFrame(for: toVC)
    
    let transitioningView = UIView(frame: frame)
    transitioningView.backgroundColor = UIColor.white

    let transitioningMask = CAShapeLayer()
    transitioningMask.path = UIBezierPath(rect: frame).cgPath
    transitioningMask.fillColor = UIColor.black.cgColor

    containerView.insertSubview(toVC.view, aboveSubview: fromVC.view)
    containerView.insertSubview(cellSnapshot, aboveSubview: toVC.view)

    selectedCell.alpha = 0.0
    toVC.view.mask = transitioningView

    let duration = self.transitionDuration(using: transitionContext)

    UIView.animateKeyframes(withDuration: duration,
                            delay: 0.0,
                            options: .calculationModeCubic,
                            animations: {
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.15, animations: {
                                cellSnapshot.alpha = 0.0
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.7, animations: {
                                transitioningView.frame = finalFrame
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8, animations: {
                                toVC.contentStackView.alpha = 1.0
                              })
    }, completion: { _ in
      toVC.view.mask = nil
      cellSnapshot.removeFromSuperview()
      selectedCell.alpha = 1.0
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }
}
