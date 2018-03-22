//
//  SDOSHero+UIViewController.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 13/7/17.
//

import UIKit
import Hero


extension UIViewController {
    
    internal static var AssociatedKeyDesiredHeroDefaultAnimationType = "SDOSHero.desiredHeroDefaultAnimationType"
    
    
    /// In this property we store the animation type set using the 3 functions setSDOSHeroAnimationTypeForModalPresentation:, setSDOSHeroAnimationTypeForModalDismissal and setSDOSHeroAnimationTypeForModalPresentation:forModalDismissal:
    /// By default, the animation types for presentations and dismissals are .auto.
    /// Setting only the animation type for presentation (with setSDOSHeroAnimationTypeForModalPresentation:) sets the desired animation type only for that animation type (and viceversa with setSDOSHeroAnimationTypeForModalDismissal:). In this case, the desired animation type for dismissal would remain unchanged (and viceversa).
    /// However, the actual heroDefaultAnimationType (the one that takes effect) may not coincide with the desired animation type.
    /// The reason is that SDOSHero translates .auto as the opposite animation of the contrary action (presentation or dismissal). Therefore, if the desired animation type for presentation is, e.g., zoom in and the desired animation type for dismissal is auto, then the actual heroDefaultAnimationType is set to zoom in for presentation and zoom out for dismissal.
    internal var desiredHeroDefaultAnimationType: HeroDefaultAnimationType {
        get {
            if let type = objc_getAssociatedObject(self, &UIViewController.AssociatedKeyDesiredHeroDefaultAnimationType) as? HeroDefaultAnimationType {
                return type
            }
            let type = HeroDefaultAnimationType.auto
            self.desiredHeroDefaultAnimationType = type
            return type
        }
        set { objc_setAssociatedObject(self, &UIViewController.AssociatedKeyDesiredHeroDefaultAnimationType, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    //MARK: - Getting the animation types
    
    /// Returns the current animation type of the receiver for modal presentations.
    /// If the returned animation type is `.auto`, then the animation for the modal presentation will be the opposite animation to that returned by `animationTypeForDismissing`.
    /// If `animationTypeForDismissing` is also `.auto`, then the animation for the modal presentation will be the default system animation.
    var animationTypeForPresenting: SDOSHeroAnimationType {
        get {
            return desiredHeroDefaultAnimationType.sdosHeroAnimationTypeForPresenting
        }
    }
    
    /// Returns the current animation type of the receiver for modal dismissals. If the returned animation type is `.auto`, then the animation for the modal dismissal will be the opposite animation to that returned by `animationTypeForDismissing`. If `animationTypeForPresenting` is also `.auto`, then the animation for modal dismissals will be the default system animation.
    var animationTypeForDismissing: SDOSHeroAnimationType {
        get {
            return desiredHeroDefaultAnimationType.sdosHeroAnimationTypeForDismissing
        }
    }
    
    
    //MARK: - Setting the animation types
    
    /// Method used to set the Hero animation type for modal presentation of the receiver. By default, the animation type for modal dismissal will be the oposite animation type. If wanted a different animation type for dismissal, it can be set using `setSDOSHeroAnimationTypeForModalDismissing:` ( or `setSDOSHeroAnimationTypeForModalPresenting:forModalDismissing:` to change both animation types at once)
    /// - Important: The receiver must be the view controller that is going to be presented (do not confuse with the presenting view controller).
    ///
    /// - Parameter type: The type of the animation for the modal presentation
    @objc public func setSDOSHeroAnimationTypeForModalPresenting(_ type: SDOSHeroAnimationType) {
        
        isHeroEnabled = true
        
        let heroPresentationType = type.heroDefaultAnimationType
        switch desiredHeroDefaultAnimationType {
        case .selectBy(presenting: _, dismissing: let currentDesiredDismissalType):
            desiredHeroDefaultAnimationType = .selectBy(presenting: heroPresentationType, dismissing: currentDesiredDismissalType)
        default:
            desiredHeroDefaultAnimationType = .selectBy(presenting: heroPresentationType, dismissing: .auto)
        }
        
        updateHeroModalAnimationType()
    }
    
    /// Method used to set the Hero animation type for modal dismissal of the receiver. By default, the animation type for modal presentation will be the oposite animation type. If wanted a different animation type for dismissal, it can be set using `setSDOSHeroAnimationTypeForModalPresenting:` ( or `setSDOSHeroAnimationTypeForModalPresenting:forModalDismissing:` to change both animation types at once)
    /// - Important: The receiver must be the view controller that is going to be dismissed (do not confuse with the presenting view controller).
    ///
    /// - Parameter type: The type of the animation for the modal dismissal
    @objc public func setSDOSHeroAnimationTypeForModalDismissing(_ type: SDOSHeroAnimationType) {
        
        isHeroEnabled = true
        
        let heroDismissalType = type.heroDefaultAnimationType
        switch desiredHeroDefaultAnimationType {
        case .selectBy(presenting: let currentDesiredPresentationType, dismissing: _):
            desiredHeroDefaultAnimationType = .selectBy(presenting: currentDesiredPresentationType, dismissing: heroDismissalType)
        default:
            desiredHeroDefaultAnimationType = .selectBy(presenting: .auto, dismissing: heroDismissalType)
        }
        
        updateHeroModalAnimationType()
    }
    
    /// Method used to set the Hero animation type for modal presentations and dismissals of the receiver. Passing .auto for both parameters will cause the modal transitions to be performed using the default animations provided by the system. Setting the animation type to .auto for only one transition will cause that transition to be animated with the opposite animation type of the other passed animation type.
    /// - Important: The receiver must be the view controller that is going to be presented and/or dismissed (do not confuse with the presenting view controller).
    ///
    /// - Parameter presentationType: The type of the animation for the modal presentation
    /// - Parameter dismissalType: The type of the animation for the modal dismissal
    @objc public func setSDOSHeroAnimationTypeForModalPresenting(_ presentationType: SDOSHeroAnimationType, forModalDismissing dismissalType: SDOSHeroAnimationType) {
        
        isHeroEnabled = true
        
        let heroPresentationType = presentationType.heroDefaultAnimationType
        let heroDismissalType = dismissalType.heroDefaultAnimationType
        desiredHeroDefaultAnimationType = .selectBy(presenting: heroPresentationType, dismissing: heroDismissalType)
        
        updateHeroModalAnimationType()
    }
    
    /// This method copies the type of the modal presentation of `viewController` and sets it on the receiver.
    ///
    /// - Parameter viewController: The `UIViewController` instance from which to copy the hero modal animation type
    @objc public func copyModalSDOSHeroAnimationTypeFrom(viewController: UIViewController) {
        
        isHeroEnabled = true
        
        desiredHeroDefaultAnimationType = viewController.desiredHeroDefaultAnimationType
        
        updateHeroModalAnimationType()
    }
    
    
    private func updateHeroModalAnimationType() {
        switch desiredHeroDefaultAnimationType {
        case .selectBy(presenting: .auto, dismissing: .auto):
            heroModalAnimationType = .auto
        case .selectBy(presenting: let presenting, dismissing: .auto):
            heroModalAnimationType = .selectBy(presenting: presenting, dismissing: presenting.oppositeAnimationType)
        case .selectBy(presenting: .auto, dismissing: let dismissing):
            heroModalAnimationType = .selectBy(presenting: dismissing.oppositeAnimationType, dismissing: dismissing)
        default:
            heroModalAnimationType = desiredHeroDefaultAnimationType
        }
    }
    
    
    //MARK: - Present methods
    
    @objc public func present(viewController: UIViewController, usingAnimation animationType: SDOSHeroAnimationType) {
        present(viewController: viewController, usingAnimation: animationType, completion: nil)
    }
    
    
    @objc public func present(viewController: UIViewController, usingAnimation animationType: SDOSHeroAnimationType, completion: (() -> Void)?) {
        let currentAnimationType = viewController.heroModalAnimationType
        viewController.heroModalAnimationType = animationType.heroDefaultAnimationType
        present(viewController, animated: true, completion: completion)
        viewController.heroModalAnimationType = currentAnimationType
    }
    
    
    //MARK: - Dismiss methods
    
    @objc public func dismissViewController(usingAnimation animationType: SDOSHeroAnimationType) {
        dismissViewController(usingAnimation: animationType, completion: nil)
    }
    
    
    @objc public func dismissViewController(usingAnimation animationType: SDOSHeroAnimationType, completion: (() -> Void)?) {
        
        // Only change the heroModalAnimationType for the controller that is going to be dismissed
        let lastPresentedViewController = self.lastPresentedViewController()
        let currentAnimationType = lastPresentedViewController.heroModalAnimationType
        lastPresentedViewController.heroModalAnimationType = animationType.heroDefaultAnimationType
        dismiss(animated: true, completion: completion)
        lastPresentedViewController.heroModalAnimationType = currentAnimationType
    }
    
    
    /// Dismisses all the presented view controllers at once using the passed animation. This method can be called on any of the view controllers in the modal stack
    ///
    /// - Parameter type: The animation used to dismiss all the presented view controllers
    @objc public func sdoshero_unwindToRootViewControllerUsing(animation type: SDOSHeroAnimationType) {
        let lastPresentedViewController = self.lastPresentedViewController()
        lastPresentedViewController.isHeroEnabled = true
        
        let heroAnimationType = type.heroDefaultAnimationType
        
        // The animation type of lastPresentedViewController is only changed for this transition
        let currentAnimationType = lastPresentedViewController.heroModalAnimationType
        
        lastPresentedViewController.heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: heroAnimationType.oppositeAnimationType)
        lastPresentedViewController.hero_unwindToRootViewController()
        
        // After the transition, the animation type of lastPresentedViewController is set to its original value
        lastPresentedViewController.heroModalAnimationType = currentAnimationType
    }

    
    //MARK: - Helper methods
    
    fileprivate func lastPresentedViewController() -> UIViewController {
        var presented = self
        while let nextPresented = presented.presentedViewController {
            presented = nextPresented
        }
        
        return presented
    }
    
}
