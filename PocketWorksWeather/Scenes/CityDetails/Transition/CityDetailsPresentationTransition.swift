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
    
    let containerView = transitionContext.containerView
    let finalFrame = transitionContext.finalFrame(for: toVC)
    
    let transitioningView = UIView(frame: frame)
    transitioningView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    
    containerView.insertSubview(transitioningView, aboveSubview: toVC.view)
    containerView.insertSubview(cellSnapshot, aboveSubview: transitioningView)
    containerView.insertSubview(toVC.view, aboveSubview: transitioningView)
    selectedCell.alpha = 0.0
    toVC.view.alpha = 0.0
    
    let duration = self.transitionDuration(using: transitionContext)
    
    UIView.animateKeyframes(withDuration: duration,
                            delay: 0.0,
                            options: .calculationModeCubicPaced,
                            animations: {
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2, animations: {
                                cellSnapshot.alpha = 0.0
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 4/5, animations: {
                                transitioningView.frame = finalFrame
                              })
                              UIView.addKeyframe(withRelativeStartTime: 4/5, relativeDuration: 1/5, animations: {
                                toVC.view.alpha = 1.0
                              })
    }, completion: { _ in
      transitioningView.removeFromSuperview()
      cellSnapshot.removeFromSuperview()
      selectedCell.alpha = 1.0
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }
}
