//
//  SDOSHeroModifierString.swift
//  FLEX
//
//  Created by Antonio Jesús Pallares on 25/7/17.
//

import Foundation

@objc public class SDOSHeroModifierString: NSObject {
    
    
    /// Convinience method that creates a Hero Modifier String from an `NSArray` of Hero Modifier Strings.
    /// - Important: Please, create each element of the `heroModifiers` array by using the constants declared in SDOSHeroConstants.h
    /// - Parameter heroModifiers: An `NSArray` containing every Hero Modifier String that will be used to create the returned object
    /// - Returns: A Hero Modifier String created from the passed `NSArray`
    @objc public class func heroModifierStringWith(heroModifiers: [String]) -> String {
        return heroModifiers.joined(separator:" ")
    }
}
