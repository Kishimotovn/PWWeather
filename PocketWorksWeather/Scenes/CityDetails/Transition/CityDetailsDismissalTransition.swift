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
    return 1.0
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
    transitioningView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    
    cellSnapshot.frame = frame
    
    containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
    containerView.insertSubview(transitioningView, belowSubview: fromVC.view)
    containerView.insertSubview(cellSnapshot, aboveSubview: transitioningView)
    cellSnapshot.alpha = 0
    
    let duration = self.transitionDuration(using: transitionContext)
    
    UIView.animateKeyframes(withDuration: duration,
                            delay: 0.0,
                            options: .calculationModeCubicPaced,
                            animations: {
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/5, animations: {
                                fromVC.view.alpha = 0.0
                              })
                              UIView.addKeyframe(withRelativeStartTime: 1/5, relativeDuration: 3/5, animations: {
                                transitioningView.frame = frame
                              })
                              UIView.addKeyframe(withRelativeStartTime: 4/5, relativeDuration: 1/5, animations: {
                                //                                aView.alpha = 0.0
                                cellSnapshot.alpha = 1.0
                              })
    }, completion: { _ in
      transitioningView.removeFromSuperview()
      cellSnapshot.removeFromSuperview()
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }
}
