//
//  CustomAnimationPresentor.swift
//  Instgram_Firebase
//
//  Created by Qahtan on 6/25/18.
//  Copyright © 2018 QahtanLab. All rights reserved.
//

import UIKit
class CustomAnimationPresentor: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // my custom transition animation cod logic
        let containerView = transitionContext.containerView
        containerView.backgroundColor = UIColor.rgb(red: 86, green: 206, blue: 139)
        guard let toView = transitionContext.view(forKey: .to) else { return }
        guard let fromView = transitionContext.view(forKey: .from) else { return}
//        fromView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//        let shrunkFrame = fromView.frame
        
        containerView.addSubview(toView)
        let startedFrame = CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
        toView.frame = startedFrame
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//            // Animation
            fromView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            let shrunkFrame = fromView.frame
            let xPoint = fromView.frame.width - 50
            fromView.frame = CGRect(x: -xPoint, y: shrunkFrame.origin.y, width: shrunkFrame.width, height: shrunkFrame.height)
            toView.frame = CGRect(x: 0, y: 0, width: toView.frame.width, height: toView.frame.height)
            
//            let xPoint = fromView.frame.width - 50
//            let imageOfFromView = fromView
//            toView.addSubview(imageOfFromView)
////            fromView.frame = CGRect(x: -xPoint, y: shrunkFrame.origin.y, width: shrunkFrame.width, height: shrunkFrame.height)
            containerView.bringSubview(toFront: fromView)
        }) { (_) in
//
            print(fromView.frame)
            transitionContext.completeTransition(true)
////            transitionContext.completeTransition(true)
        }
        
    }
}
