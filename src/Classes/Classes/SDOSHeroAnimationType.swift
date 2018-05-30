//
//  SDOSHeroAnimationType.swift
//
//  Copyright © 2018 SDOS. All rights reserved.
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
        return HeroDefaultAnimationType.sdosHeroAnimationTypeFrom(basicHeroDefaultAnimationType: self.heroDefaultAnimationType)
    }
}

public extension HeroDefaultAnimationType.Direction {
    public var descr: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .up:
            return "up"
        case .down:
            return "down"
        }
    }
}

public extension HeroDefaultAnimationType {
    public var descr: String {
        switch self {
        case .selectBy(presenting: let presenting, dismissing: let dismissing):
            return "[\(presenting.descr),\(dismissing.descr)]"
        case .auto:
            return "auto"
        case .fade:
            return "fade"
        case .zoom:
            return "zoom"
        case .zoomOut:
            return "zoomOut"
        case .push(direction: let dir):
            return "push_\(dir.descr)"
        case .pull(direction: let dir):
            return "pull_\(dir.descr)"
        case .cover(direction: let dir):
            return "cover_\(dir.descr)"
        case .uncover(direction: let dir):
            return "uncover_\(dir.descr)"
        case .slide(direction: let dir):
            return "slide_\(dir.descr)"
        case .zoomSlide(direction: let dir):
            return "zoomSlide_\(dir.descr)"
        case .pageIn(direction: let dir):
            return "pageIn_\(dir.descr)"
        case .pageOut(direction: let dir):
            return "pageOut_\(dir.descr)"
        case .none:
            return "none"
        }
    }
}


