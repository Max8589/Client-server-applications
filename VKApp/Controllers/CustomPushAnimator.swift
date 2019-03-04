//
//  CustomPushAnimator.swift
//  VKApp
//
//  Created by admin on 20/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
       
        let translation = CGAffineTransform(translationX: 0, y: source.view.frame.height)
        let rotate = CGAffineTransform(rotationAngle: -90)
        destination.view.transform = translation.concatenating(rotate)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        _ = CGAffineTransform(translationX: source.view.frame.width / 2, y: source.view.frame.height / 2)
                                                        _ = CGAffineTransform(rotationAngle: 0)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.4,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        source.view.transform = CGAffineTransform(translationX:source.view.frame.width , y: 0)
                                                        
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
   }
    
}

