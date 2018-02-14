//
//  SDOSHero+UIViewController.swift
//  Hero
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
    @objc public func setSDOSHeroModalPresentationDefaultAnimationType(_ type: SDOSHeroDefaultAnimationType) {
        let heroAnimationType = type.heroDefaultAnimationType
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting:heroAnimationType)
    }
    
    
    /// This method copies the type of the modal presentation of `viewController` and sets it on the receiver.
    ///
    /// - Parameter viewController: The `UIViewController` instance from which to copy the hero modal animation type
    @objc public func copySDOSHeroModalPresentationDefaultAnimationTypeFrom(viewController: UIViewController) {
        heroModalAnimationType = viewController.heroModalAnimationType ?? .auto
    }
    
}
