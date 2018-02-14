//
//  SDOSHeroNavigationController.swift
//  Pods
//
//  Created by Antonio Jesús Pallares on 12/6/17.
//
//

import UIKit
import Hero

public class SDOSHeroNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    private var arrayHeroAnimationPushHistory = [HeroDefaultAnimationType]()
    private lazy var heroTransition: HeroTransition = {
        let heroTransition = HeroTransition.init()
//        self.transitioningDelegate = heroTransition // This must not be done because it would override the modal presentation animation types
        self.delegate = heroTransition
        return heroTransition
    }()
    
    
    //MARK: - Initialization
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        isHeroEnabled = true
        heroNavigationAnimationType = .push(direction: .left)
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: .cover(direction: .up))
    }
    
    
    public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        isHeroEnabled = true
        heroNavigationAnimationType = .push(direction: .left)
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: .cover(direction: .up))
    }
    
    
    public init(rootViewController: UIViewController, defaultPushSDOSHeroAnimationType pushType: SDOSHeroDefaultAnimationType, defaultModalSDOSHeroAnimationType modalType: SDOSHeroDefaultAnimationType) {
        super.init(rootViewController: rootViewController)
        heroNavigationAnimationType = pushType.heroDefaultAnimationType
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting:modalType.heroDefaultAnimationType)
        isHeroEnabled = true
    }
    
    
    public init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?, defaultPushSDOSHeroAnimationType pushType: SDOSHeroDefaultAnimationType, defaultModalSDOSHeroAnimationType modalType: SDOSHeroDefaultAnimationType) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        heroNavigationAnimationType = pushType.heroDefaultAnimationType
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting:modalType.heroDefaultAnimationType)
        isHeroEnabled = true
    }
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        heroNavigationAnimationType = .push(direction: .left)
        heroModalAnimationType = HeroDefaultAnimationType.autoReverse(presenting: .cover(direction: .up))
        isHeroEnabled = true
    }
    
    
    //MARK: - Changing the Animation type
    
    /// Method used to set the default animation type for push and pop transitions.
    ///
    /// - Parameter type: The type of the animation for the navigation transitions.
    @objc public func setSDOSHeroNavigationDefaultAnimationType(_ type: SDOSHeroDefaultAnimationType) {
        heroNavigationAnimationType = type.heroDefaultAnimationType
    }
    
    private var heroAnimationForNextNavigationTransition: HeroDefaultAnimationType?
    
    /// Method used to set the animation type for the next navigation transition.
    ///
    /// - Parameter type: The type of the animation for the next navigation.
    @objc public func setDefaultAnimationForNextNavigationTransition(_ type: SDOSHeroDefaultAnimationType) {
        heroAnimationForNextNavigationTransition = type.heroDefaultAnimationType
    }
    
    
    //MARK: - Navigation

    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        var animationType: HeroDefaultAnimationType?
        
        if heroAnimationForNextNavigationTransition != nil {
            animationType = heroAnimationForNextNavigationTransition
            heroAnimationForNextNavigationTransition = nil
        }
        if animationType == nil {
            animationType = heroNavigationAnimationType
        }
        
        heroTransition.defaultAnimation = animationType!
        
        arrayHeroAnimationPushHistory.append(animationType!)
        super.pushViewController(viewController, animated: animated)
        
        updateInteractivePopGestureRecognizer()
        
        // Disable the interactions during the push animation
        customInteractivePopGestureRecognizer?.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.351) {
            self.customInteractivePopGestureRecognizer?.isEnabled = true
        }
    }
    
    
    public override func popViewController(animated: Bool) -> UIViewController? {
        var animationType: HeroDefaultAnimationType? = arrayHeroAnimationPushHistory.popLast()?.oppositeAnimationType
        
        if heroAnimationForNextNavigationTransition != nil {
            animationType = heroAnimationForNextNavigationTransition
            heroAnimationForNextNavigationTransition = nil
        }
        
        if animationType == nil {
            animationType = heroNavigationAnimationType.oppositeAnimationType
        }
        
        updateInteractivePopGestureRecognizer()
    
        heroTransition.defaultAnimation = animationType!
        
        let controller = super.popViewController(animated: animated)
        
        return controller
    }
    
    
    public override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if let index = viewControllers.index(of: viewController) {
            var arrayAnimations = arrayHeroAnimationPushHistory[0...index]
            var animationType = arrayAnimations.popLast()?.oppositeAnimationType
            arrayHeroAnimationPushHistory = Array(arrayAnimations)
            
            if (animationType == nil) {
                animationType = heroNavigationAnimationType.oppositeAnimationType
            }
            
            updateInteractivePopGestureRecognizer()
            
            heroTransition.defaultAnimation = animationType!
        }
        return super.popToViewController(viewController, animated: animated)
    }
    
    
    public override func popToRootViewController(animated: Bool) -> [UIViewController]? {
     
        var animationType: HeroDefaultAnimationType? = arrayHeroAnimationPushHistory.first?.oppositeAnimationType
        arrayHeroAnimationPushHistory.removeAll()
        
        if (animationType == nil) {
            animationType = heroNavigationAnimationType.oppositeAnimationType
        }
        
        updateInteractivePopGestureRecognizer()
        
        heroTransition.defaultAnimation = animationType!
        return super.popToRootViewController(animated: animated)
    }
    
    
    //MARK: - UIGestureRecognizerDelegate
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer {
            return true
        }
        
        if super.responds(to: #selector(gestureRecognizerShouldBegin(_:))) {
            return super.perform(#selector(gestureRecognizerShouldBegin(_:)), with:gestureRecognizer) as! Bool
        }
        return false
    }
    
    
    //MARK: - Interactive Transition
    
    private var supportsInteractiveTransition: Bool = true {
        didSet {
            updateInteractivePopGestureRecognizer()
        }
    }
    
    
    private func updateInteractivePopGestureRecognizer() {
        
        guard animationTypeForCurrentPop == nil else {
            // Nothing to do here yet, because an animation (due to user touches) is taking place
            return
        }
        
        if supportsInteractiveTransition && arrayHeroAnimationPushHistory.count > 0 {
            
            let edges: UIRectEdge = arrayHeroAnimationPushHistory.last!.edgeForPanGesture
            if customInteractivePopGestureRecognizer == nil || customInteractivePopGestureRecognizer!.edges != edges {
                let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlePan(gestureRecognizer:)))
                // In order for the gesture to be recognized when edges == .top or .bottom, it is necessary for the ViewController's prefersStatusBarHidden method to return true
                edgePanGesture.edges = edges
                customInteractivePopGestureRecognizer = edgePanGesture
            }
        } else {
            customInteractivePopGestureRecognizer = nil
        }
    }
    
    
    private var customInteractivePopGestureRecognizer: UIScreenEdgePanGestureRecognizer? {
        didSet {
            if oldValue != nil {
                view.removeGestureRecognizer(oldValue!)
            }
            if customInteractivePopGestureRecognizer != nil {
                view.addGestureRecognizer(customInteractivePopGestureRecognizer!)
            }
        }
    }
    

    override public var interactivePopGestureRecognizer: UIGestureRecognizer? {
        get {
            return customInteractivePopGestureRecognizer
        }
    }
    
    
    private var animationTypeForCurrentPop: HeroDefaultAnimationType?
    
    func handlePan(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        var progress = abs(gestureRecognizer.translation(in: self.view).x / self.view.bounds.width)
        progress = min(1.0, max(0.0, progress))
        
        switch gestureRecognizer.state {
        case .began:
            // Since in popViewController(animated:) we drop the last element of arrayHeroAnimationPushHistory. We need to temporaly store it in order to be able to put the animation back to arrayHeroAnimationPushHistory in case the pop is cancelled after all.
            animationTypeForCurrentPop = arrayHeroAnimationPushHistory.last?.oppositeAnimationType
            // begin the transition as normal
            heroTransition.start()
            popViewController(animated: true)
            if let _ = self.delegate as? HeroTransition {
                heroTransition.update(progress)
            }
        case .changed:
            if let _ = self.delegate as? HeroTransition {
                heroTransition.update(progress)
            }
        case .cancelled:
            if let _ = self.delegate as? HeroTransition {
                cancelPop()
            }
        case .failed:
            if let _ = self.delegate as? HeroTransition {
                cancelPop()
            }
        case .ended:
            if let _ = self.delegate as? HeroTransition {
                
                if progress + gestureRecognizer.relativeVelocity > 0.5 {
                    // This "hack" (Dispatch) is needed in order to avoid a crash. This crash could happen if the panning is quickly released after it is started.
                    // See: https://github.com/lkzhao/Hero/issues/203
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01, execute: {
                        self.endPop()
                    })
                } else {
                    cancelPop()
                }
            }
        default:
            if let _ = self.delegate as? HeroTransition{
                if progress > 0.5 {
                    endPop()
                } else {
                    cancelPop()
                }
            }
        }
    }
    
    
    private func cancelPop() {
        if animationTypeForCurrentPop != nil {
            arrayHeroAnimationPushHistory.append(animationTypeForCurrentPop!.oppositeAnimationType)
            animationTypeForCurrentPop = nil
        }
        heroTransition.cancel(animate: true)
        updateInteractivePopGestureRecognizer()
    }
    
    
    private func endPop() {
        animationTypeForCurrentPop = nil
        heroTransition.finish(animate: true)
        updateInteractivePopGestureRecognizer()
    }
}


fileprivate extension UIScreenEdgePanGestureRecognizer {
    var relativeVelocity: CGFloat {
        guard let view = view else {
            return 0
        }
        switch self.edges {
        case UIRectEdge.left:
            return velocity(in: nil).x / view.frame.size.width
        case UIRectEdge.right:
            return -velocity(in: nil).x / view.frame.size.width
        case UIRectEdge.top:
            return velocity(in: nil).y / view.frame.size.height
        case UIRectEdge.bottom:
            return -velocity(in: nil).y / view.frame.size.height
        default:
            return velocity(in: nil).x / view.frame.size.width
        }
    }
    
}


fileprivate extension HeroDefaultAnimationType {
    var edgeForPanGesture: UIRectEdge {
        switch self {
        case .push(let direction), .pull(let direction), .cover(let direction), .slide(let direction), .zoomSlide(let direction), .pageIn(let direction), .pageOut(let direction):
            switch direction {
            case .left:
                return .left
            case .right:
                return .right
            case .up:
                return .top
            case .down:
                return .bottom
            }
        default:
            return .left
        }
    }
}
