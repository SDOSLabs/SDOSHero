//
//  SDOSHeroModifier.swift
//  Hero
//
//  Created by Antonio Jesús Pallares on 24/4/18.
//

import Hero

@objc public class SDOSHeroModifier: NSObject {
    
    internal var heroModifier: HeroModifier
    
    private init(heroModifier: HeroModifier) {
        self.heroModifier = heroModifier
    }
    
    
    //MARK: - Basic modifiers
    
    @objc public class func HeroModifierFade() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .fade)
    }
    
    @objc public class func HeroModifierForceNonFade() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .forceNonFade)
    }
    
    @objc public class func HeroModifierPosition(_ position: CGPoint) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .position(position))
    }
    
    @objc public class func HeroModifierSize(_ size: CGSize) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .size(size))
    }
    
    
    //MARK: - Transform modifiers
    
    @objc public class func HeroModifierTransform(_ t: CATransform3D) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .transform(t))
    }

    @objc public class func HeroModifierPerspective(_ perspective: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .perspective(perspective))
    }
    
    @objc public class func HeroModifierScale3D(x x: CGFloat, y y: CGFloat, z z: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .scale(x: x, y: y, z: z))
    }
    
    @objc public class func HeroModifierScale(_ scale: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .scale(scale))
    }
    
    @objc public class func HeroModifierTranslate(point: CGPoint) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .translate(point))
    }
    
    @objc public class func HeroModifierTranslate(x x: CGFloat, y y: CGFloat, z z: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .translate(x: x, y: y, z: z))
    }
    
    @objc public class func HeroModifierRotate(_ z: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .rotate(z))
    }
    
    @objc public class func HeroModifierRotateXYZ(x x: CGFloat, y y: CGFloat, z z: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .rotate(x: x, y: y, z: z))
    }
    
    
    //MARK: - Appearance modifiers
 
    @objc public class func HeroModifierOpacity(_ opacity: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .opacity(opacity))
    }
 
    @objc public class func HeroModifierBackgroundColor(_ color: UIColor) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .backgroundColor(color))
    }
 
    @objc public class func HeroModifierCornerRadius(_ cornerRadius: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .cornerRadius(cornerRadius))
    }
 
    @objc public class func HeroModifierZPosition(_ zPosition: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .zPosition(zPosition))
    }
 
    @objc public class func HeroModifierContentsRect(_ contentsRect: CGRect) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .contentsRect(contentsRect))
    }
    
    @objc public class func HeroModifierContentsScale(_ contentsScale: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .contentsScale(contentsScale))
    }
    
    @objc public class func HeroModifierBorderWidth(_ borderWidth: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .borderWidth(borderWidth))
    }
    
    @objc public class func HeroModifierBorderColor(_ borderColor: UIColor) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .borderColor(borderColor))
    }
    
    @objc public class func HeroModifierShadowColor(_ shadowColor: UIColor) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .shadowColor(shadowColor))
    }
    
    @objc public class func HeroModifierShadowOpacity(_ shadowOpacity: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .shadowOpacity(shadowOpacity))
    }
    
    @objc public class func HeroModifierShadowOffset(_ shadowOffset: CGSize) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .shadowOffset(shadowOffset))
    }
    
    @objc public class func HeroModifierShadowRadius(_ shadowRadius: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .shadowRadius(shadowRadius))
    }
    
    @objc public class func HeroModifierShadowPath(_ shadowPath: CGPath) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .shadowPath(shadowPath))
    }
    
    @objc public class func HeroModifierMasksToBounds(_ masksToBounds: Bool) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .masksToBounds(masksToBounds))
    }
    
    @objc public class func HeroModifierOverlayColor(_ color: UIColor, opacity: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .overlay(color: color, opacity: opacity))
    }
    
    @objc public class func HeroModifierDuration(_ duration: Double) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .duration(duration))
    }
    
    @objc public class func HeroModifierDurationMatchLongest() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .durationMatchLongest)
    }
    
    @objc public class func HeroModifierDelay(_ delay: Double) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .delay(delay))
    }
    
    @available(iOS 9, *)
    @objc public class func HeroModifierSpring(stiffness: CGFloat, damping: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .spring(stiffness: stiffness, damping: damping))
    }
    
    @objc public class func HeroModifierTimingFunction(_ timingFunction: CAMediaTimingFunction) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .timingFunction(timingFunction))
    }
    
    @objc public class func HeroModifierSource(_ source_heroID: String) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .source(heroID: source_heroID))
    }
    
    @objc public class func HeroModifierArc(_ intensity: CGFloat) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .arc(intensity: intensity))
    }
    
    @objc public enum HeroModifierCascadeDirection: Int {
        case topToBottom
        case bottomToTop
        case leftToRight
        case rightToLeft
    }

    @objc public class func HeroModifierCascade(delta: TimeInterval, direction: HeroModifierCascadeDirection, delayMatchedViews: Bool) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .cascade(delta: delta, direction: direction.cascadeDirection, delayMatchedViews: delayMatchedViews))
    }
    
    @objc public class func HeroModifierCascadeRadial(delta: TimeInterval, center: CGPoint, delayMatchedViews: Bool) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .cascade(delta: delta, direction: .radial(center: center), delayMatchedViews: delayMatchedViews))
    }
    
    @objc public class func HeroModifierCascadeInverseRadial(delta: TimeInterval, center: CGPoint, delayMatchedViews: Bool) -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .cascade(delta: delta, direction: .inverseRadial(center: center), delayMatchedViews: delayMatchedViews))
    }
    
    
    //MARK: - Advanced modifiers
    
    @objc public class func HeroModifierUseGlobalCoordinateSpace() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .useGlobalCoordinateSpace)
    }

    @objc public class func HeroModifierIgnoreSubviewModifiers() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .ignoreSubviewModifiers)
    }
    
    @objc public class func HeroModifierUseOptimizedSnapshot() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .useOptimizedSnapshot)
    }
    
    @objc public class func HeroModifierUseNormalSnapshot() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .useNormalSnapshot)
    }
    
    @objc public class func HeroModifierUseLayerRenderSnapshot() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .useLayerRenderSnapshot)
    }
    
    @objc public class func HeroModifierUseNoSnapshot() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .useNoSnapshot)
    }
    
    @objc public class func HeroModifierForceAnimate() -> SDOSHeroModifier {
        return SDOSHeroModifier.init(heroModifier: .forceAnimate)
    }
}

extension SDOSHeroModifier.HeroModifierCascadeDirection {
    internal var cascadeDirection: CascadeDirection {
        switch self {
        case .topToBottom:
            return .topToBottom
        case .bottomToTop:
            return .bottomToTop
        case .leftToRight:
            return .leftToRight
        case .rightToLeft:
            return .rightToLeft
        }
    }
}
