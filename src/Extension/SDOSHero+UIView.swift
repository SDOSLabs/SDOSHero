//
//  SDOSHero+UIView.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 13/12/17.
//  Copyright © 2017 SDOS. All rights reserved.
//

import Foundation
import UIKit
import Hero

extension UIView {
    
    /// Convinience method that sets the heroModifierString of the receiver from the items of an `NSArray` of Hero Modifier Strings.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    @objc func setHeroModifierStringWith(heroModifiers: [String]) {
        setHeroModifierStringWith(heroModifiers: heroModifiers, withAutolayoutEnabled: false)
    }
    
    
    @objc func setHeroModifierStringWith(heroModifiers: [String], withAutolayoutEnabled autolayoutEnabled: Bool) {
        heroModifierString = SDOSHeroModifierString.heroModifierStringWith(heroModifiers: heroModifiers)
        if (autolayoutEnabled) {
            if (self.heroModifiers != nil) {
                self.heroModifiers?.append(HeroModifier.autolayout)
            } else {
                self.heroModifiers = [HeroModifier.autolayout]
            }
        }
    }
}


fileprivate class SDOSHeroModifierString: NSObject {
    
    /// Convinience method that creates a Hero Modifier String from an `NSArray` of Hero Modifier Strings.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    /// - Returns: A Hero Modifier String created from the passed `NSArray`
    class func heroModifierStringWith(heroModifiers: [String]) -> String {
        return heroModifiers.joined(separator:" ")
    }
}
