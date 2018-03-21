//
//  SDOSHero+UIViewController.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 13/7/17.
//

import Foundation
import UIKit
import Hero

extension UIViewController {
    
    
    /// Method used to set the Hero animation type for modal presentation of the receiver.
    /// - Important: The receiver must be the view controller that is going to be presented (do not confuse with the presenting view controller).
    ///
    /// - Parameter type: The type of the modal animation.
    @objc public func setModalSDOSHeroAnimationType(_ type: SDOSHeroAnimationType) {
        let heroAnimationType = type.heroDefaultAnimationType
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting:heroAnimationType)
    }
    
    
    /// This method copies the type of the modal presentation of `viewController` and sets it on the receiver.
    ///
    /// - Parameter viewController: The `UIViewController` instance from which to copy the hero modal animation type
    @objc public func copyModalSDOSHeroAnimationTypeFrom(viewController: UIViewController) {
        heroModalAnimationType = viewController.heroModalAnimationType
    }
    
    
    /// Dismisses all the presented view controllers at once using the oposite animation of the animation used to present the first presented view controller in the modal stack
    /// - Important: Use this method only for view controllers presented modally
    ///
    /// - Discussion: This method can be called on any of the view controllers in the modal stack
    @objc public func dismissAllPresentedViewControllers() {
        
        let (firstPresentingViewController, lastPresentedViewController) = firstPresentingAndLastPresentedViewControllers()
        if firstPresentingViewController != nil && lastPresentedViewController != nil {
            lastPresentedViewController!.copyModalSDOSHeroAnimationTypeFrom(viewController: firstPresentingViewController!.presentedViewController!)
            lastPresentedViewController!.hero_unwindToRootViewController()
        } else {
            print("There is no presented View Controller to dismiss")
        }
    }
    
    
    /// Dismisses all the presented view controllers at once using the passed animation
    ///
    /// - Parameter type: The animation used to dismiss all the presented view controllers
    ///
    /// - Discussion: This method can be called on any of the view controllers in the modal stack
    @objc public func dismissAllPresentedViewControllersUsing(animationType type: SDOSHeroAnimationType) {
        
        let (firstPresentingViewController, lastPresentedViewController) = firstPresentingAndLastPresentedViewControllers()
        if firstPresentingViewController != nil && lastPresentedViewController != nil {
            
            if !lastPresentedViewController!.isHeroEnabled {
                lastPresentedViewController!.isHeroEnabled = true
            }
            
            let heroAnimationType = type.heroDefaultAnimationType
            lastPresentedViewController!.heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: heroAnimationType.oppositeAnimationType)
            lastPresentedViewController!.hero_unwindToRootViewController()
        } else {
            print("There is no presented View Controller to dismiss")
        }
    }
    
    
    fileprivate func firstPresentingAndLastPresentedViewControllers() -> (UIViewController?, UIViewController?) {
        var presenting = self.presentingViewController
        while let previousPresenting = presenting?.presentingViewController {
            presenting = previousPresenting
        }
        
        var presented = presenting?.presentedViewController
        while let nextPresented = presented?.presentedViewController {
            presented = nextPresented
        }
        
        return (presenting, presented)
    }
}
