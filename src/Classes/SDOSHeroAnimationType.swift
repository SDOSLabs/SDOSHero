//
//  SDOSHeroAnimationType.swift
//  SDOSHero
//
//  Created by Antonio Jesús Pallares on 27/3/18.
//

import Hero

@objc public enum SDOSHeroAnimationType: Int {
    case auto = 0
    case pushLeft
    case pushRight
    case pushUp
    case pushDown
    case pullLeft
    case pullRight
    case pullUp
    case pullDown
    case coverLeft
    case coverRight
    case coverUp
    case coverDown
    case uncoverLeft
    case uncoverRight
    case uncoverUp
    case uncoverDown
    case slideLeft
    case slideRight
    case slideUp
    case slideDown
    case zoomSlideLeft
    case zoomSlideRight
    case zoomSlideUp
    case zoomSlideDown
    case pageInLeft
    case pageInRight
    case pageInUp
    case pageInDown
    case pageOutLeft
    case pageOutRight
    case pageOutUp
    case pageOutDown
    case fade
    case zoom
    case zoomOut
    case none
}

public extension SDOSHeroAnimationType {
    var oppositeAnimationType: SDOSHeroAnimationType {
        return HeroDefaultAnimationType.sdosHeroAnimationTypeFrom(basicHeroDefaultAnimationType: self.heroDefaultAnimationType.oppositeAnimationType)
    }
}

public func oppositeAnimation(type: SDOSHeroAnimationType) -> SDOSHeroAnimationType {
    return type.oppositeAnimationType
}


