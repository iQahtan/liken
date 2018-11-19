//
//  CustomAnimationDismisser.swift
//  Instgram_Firebase
//
//  Created by Qahtan on 6/25/18.
//  Copyright © 2018 QahtanLab. All rights reserved.
//

import UIKit

class CustomAnimationDismisser: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let conteinerView = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to) else { return}
        guard let fromView = transitionContext.view(forKey: .from) else { return}
        
        conteinerView.addSubview(toView)
        let startFrame = CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
        toView.frame = startFrame
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            fromView.frame = CGRect(x: -fromView.frame.width, y: 0, width: toView.frame.width, height: fromView.frame.height)
            
            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
