//
//  SDOSHero+UIView.swift
//
//  Copyright © 2018 SDOS. All rights reserved.
//

import Hero


extension UIView {
    
    //MARK: - Getters and setters for Objective-C.

    /// **sdosHeroID** is the identifier for the view. When doing a transition between two view controllers,
    /// Hero will search through all the subviews for both view controllers and matches views with the same **sdosHeroID**.
    ///
    /// Whenever a pair is discovered, Hero will automatically transit the views from source state to the destination state.
    @objc public var sdosHeroID: String? {
        get {
            return hero.id
        }
        set {
            hero.id = newValue
        }
    }
    
    /// **sdosHeroIsEnabled** allows to specify whether a view and its subviews should be considered for animations.
    /// If YES, Hero will search through all the subviews for heroIds and modifiers. Defaults to YES
    @objc public var sdosHeroIsEnabled: Bool {
        get {
            return hero.isEnabled
        }
        set {
            hero.isEnabled = newValue
        }
    }
    
    /// **sdosHeroIsEnabledForSubviews** allows to specify whether a view's subviews should be considered for animations.
    /// If true, Hero will search through all the subviews for heroIds and modifiers. Defaults to true
    @objc public var sdosHeroIsEnabledForSubviews: Bool {
        get {
            return hero.isEnabledForSubviews
        }
        set {
            hero.isEnabledForSubviews = newValue
        }
    }
    
    
    //MARK: - Setting Hero modifiers
    
    /// Sets the Hero modifiers of the receiver from the items of an `NSArray` of Hero Modifier.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    @objc public func setSDOSHeroModifiers(_ heroModifiers: [SDOSHeroModifier]?) {
        let finalHeroModifiers = heroModifiers ?? []
        hero.modifiers = finalHeroModifiers.flatMap({ $0.heroModifier })
    }
    
}

