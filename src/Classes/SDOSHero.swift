//
//  SDOSHero.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

import Hero

@objc public class SDOSHero: NSObject {
    public class func oppositeAnimation(_ type: SDOSHeroAnimationType) -> SDOSHeroAnimationType {
        return type.oppositeAnimationType
    }
}
