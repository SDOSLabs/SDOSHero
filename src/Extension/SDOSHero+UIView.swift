//
//  SDOSHero+UIView.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 13/12/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

import Hero


extension UIView {
    
    //MARK: - Getters and setters for Objective-C.

    @objc public var sdosHeroID: String? {
        get {
            return hero.id
        }
        set {
            hero.id = newValue
        }
    }
    
    
    @objc public var sdosHeroIsEnabled: Bool {
        get {
            return hero.isEnabled
        }
        set {
            hero.isEnabled = newValue
        }
    }
    
    
    @objc public var sdosHeroIsEnabledForSubviews: Bool {
        get {
            return hero.isEnabledForSubviews
        }
        set {
            hero.isEnabledForSubviews = newValue
        }
    }
    
    
    //MARK: - Setting Hero modifiers
    
    /// Convenience method that sets the heroModifierString of the receiver from the items of an `NSArray` of Hero Modifier Strings.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    @objc public func setSDOSHeroModifiers(_ heroModifiers: [SDOSHeroModifier]) {
        setSDOSHeroModifiers(heroModifiers, withAutolayoutEnabled: false)
    }
    
    /// Convenience method that sets the heroModifierString of the receiver from the items of an `NSArray` of Hero Modifier Strings and whether or not autolayout Hero modifier must be set for the receiver.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    /// - Parameter autolayoutEnabled: If set to YES, Hero will be forced to respect the receiver's autolayout constraints. This is needed due to a bug in Hero in cases where the receiver might be misplaced because it is animating since the view controller is created.
    @objc public func setSDOSHeroModifiers(_ heroModifiers: [SDOSHeroModifier], withAutolayoutEnabled autolayoutEnabled: Bool) {
        hero.modifierString = SDOSHeroModifierString.heroModifierString(withHeroModifiers:heroModifiers)
        if (autolayoutEnabled) {
            if (self.hero.modifiers != nil) {
                self.hero.modifiers?.append(HeroModifier.autolayout)
            } else {
                self.hero.modifiers = [HeroModifier.autolayout]
            }
        }
    }
}


fileprivate class SDOSHeroModifierString: NSObject {
    
    /// Convenience method that creates a Hero Modifier String from an `NSArray` of Hero Modifier Strings.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    /// - Returns: A Hero Modifier String created from the passed `NSArray`
    class func heroModifierString(withHeroModifiers heroModifiers: [SDOSHeroModifier]) -> String {
        return heroModifiers.flatMap({ $0.string }).joined(separator:" ")
    }
}
